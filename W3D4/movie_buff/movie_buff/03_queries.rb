def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .joins(:actors)
    .where('actors.name IN (?)', those_actors)
    .group('movies.id')
    .having('COUNT(actors.id) >= ?', those_actors.length)
    .select('movies.title, movies.id')
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .group('yr')
    .order('AVG(score) DESC')
    .limit(1)
    .pluck('yr')[0] / 10 * 10
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  subquery = Movie.select('movies.id').joins(:actors).where('actors.name = ?', name)
  Movie
    .joins(:actors)
    .where.not(actors: { name: name })
    .where(movies: { id: subquery })
    .distinct
    .pluck('actors.name')

  # subquery = Movie.select('movies.id').joins(:actors).where('actors.name = ?', name)
  # Movie
  #   .joins(:actors)
  #   .where.not(actors: { name: name })
  #   .where('movies.id IN ?', subquery)
  #   .pluck('actors.name')

  # Movie
  #   .select('movies.id')
  #   .joins(:actors)
  #   .where('actors.name = ?', name)
  #     .joins(:actors)
  #     .where.not(actors: { name: name })
  #     .pluck('actors.name')
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:castings)
    .where('castings.actor_id IS NULL')
    .pluck('COUNT(*)')[0]
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  matcher = "%#{whazzername.split(//).join('%')}%"

  Movie
    .joins(:actors)
    .where('UPPER(actors.name) LIKE UPPER(?)', matcher)

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor
    .joins(:movies)
    .group('actors.id')
    .select('actors.id, actors.name, MAX(yr) - MIN(yr) AS career')
    .order('career DESC')
    .limit(3)
end
