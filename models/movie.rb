require("pg")
require_relative("../db/sql_runner.rb")

class Movie

  attr_accessor :id, :title, :genre

  def initialize(options)
    @id     = options["id"].to_i if options["id"]
    @title  = options["title"]
    @genre  = options["genre"]
  end

  def save()
    sql = "
      INSERT INTO movies (title, genre)
      VALUES ($1, $2)
      RETURNING id;
    "
    values = [@title, @genre]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def self.delete_all()
    sql = "
      DELETE FROM movies;
    "
    SqlRunner.run(sql)
  end

  def update()
    sql = "
      UPDATE movies
      SET (title, genre) = ($1, $2)
      WHERE id = $3;
    "
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def actors()
    # we have movie id
    sql = "
    SELECT actors.*
    FROM actors

    INNER JOIN roles
    ON actors.id = roles.actor_id

    WHERE roles.movie_id = $1;
    "
    values = [@id]
    results = SqlRunner.run(sql, values)
    actors = results.map { |actor_hash| Actor.new(actor_hash) }
    # return array of actor objects
  end

end
