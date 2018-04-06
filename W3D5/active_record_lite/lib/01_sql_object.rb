require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
require 'byebug'
class SQLObject
  def self.columns
    return @columns if @columns

    res = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @columns = res.first.map(&:to_sym)
  end

  def self.finalize!
    # debugger
    self.columns.each do |column_name|
      define_method(column_name) do
        attributes[column_name]
      end

      define_method("#{column_name}=") do |new_value|
        attributes[column_name] = new_value
      end
    end
  end

  # def self.finalize!
  #   self.columns.each do |column_name|
  #     define_method(column_name) do
  #       @attributes[column_name]
  #     end
  #
  #     define_method("#{column_name}=") do |new_value|
  #       @attributes[column_name] = new_value
  #     end
  #   end
  # end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ? @table_name : self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name};
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result)}
  end

  def self.find(id)
    self.all.find { |obj| obj.id == id}
  end

  def initialize(params = {})
    # @attributes = {}
    attr_names = self.class.columns
    params.each do |attr_name, attr_value|
      raise("unknown attribute '#{attr_name}'") unless attr_names.include?(attr_name.to_sym)
      self.send("#{attr_name}=", attr_value)
    end
  end

  # def attributes
  #   # debugger
  #   @attributes
  #
  # end

  def attributes
    # debugger
    @attributes ||= {}

  end

  def attribute_values
    attributes.values
  end

  def insert
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{self.class.columns.drop(1).join(',')})
      VALUES
        (#{(["?"] * self.attributes.length).join(',')});
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    DBConnection.execute(<<-SQL, *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{self.class.columns.map {|col| "#{col} = ?"}.join(',')}
      WHERE
        id = #{self.id}
    SQL
  end

  def save
    id ? update : insert
  end
end
