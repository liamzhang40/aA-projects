# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      gdp IS NOT NULL AND gdp > (
        SELECT
          MAX(gdp)
        FROM
          countries
        WHERE
          continent = 'Europe'
      )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    -- SELECT
    --   a.continent, a.name, a.area
    -- FROM
    --   countries AS a
    -- JOIN
    --   countries AS b ON a.continent = b.continent
    -- WHERE
    --   a.name != b.name
    -- GROUP BY
    --   a.name
    -- HAVING
    --   a.population > MAX(b.population);

    -- SELECT
    --   a.continent, a.name, a.area
    -- FROM
    --   countries AS a
    -- WHERE
    --   a.area > ALL(
    --     SELECT
    --       b.area
    --     FROM
    --       countries AS b
    --     WHERE
    --       a.name != b.name AND a.continent = b.continent
    --   );

    SELECT
      a.continent, a.name, a.area
    FROM
      countries AS a
    WHERE
      a.area = (
        SELECT
          MAX(b.area)
        FROM
          countries AS b
        WHERE
          a.continent = b.continent
      );

  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
      a.name, a.continent
    FROM
      countries AS a
    WHERE
      a.population > ALL(
        SELECT
          b.population * 3
        FROM
          countries AS b
        WHERE
          a.name != b.name AND a.continent = b.continent
      );
  SQL
end
