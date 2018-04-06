require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{params.keys.map {|col| "#{col} = ?"}.join(" AND ")};
    SQL

    parse_all(results)
  end
end

class SQLObject
  extend Searchable# Mixin Searchable here...
end
