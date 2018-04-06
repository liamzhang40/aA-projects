require_relative '03_associatable'
require 'byebug'
# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]
      mid_model_class = through_options.model_class
      # debugger
      through_table = through_options.table_name
      through_primary_key = through_options.primary_key
      through_foreign_key = through_options.foreign_key
      # debugger
      source_table = source_options.table_name
      source_primary_key = source_options.primary_key
      source_foreign_key = source_options.foreign_key

      self_id = self.send(through_foreign_key)
      results = DBConnection.execute(<<-SQL, self_id)
        SELECT
          #{source_table}.*
        FROM
          #{through_table}
        JOIN
          #{source_table} ON #{source_table}.#{source_primary_key} = #{through_table}.#{source_foreign_key}
        WHERE
          #{through_table}.#{through_primary_key} = ?;
      SQL

      source_options.model_class.parse_all(results).first

    end
  end
end
