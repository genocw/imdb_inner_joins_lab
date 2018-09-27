require_relative("actor.rb")
require_relative("movie.rb")
require("pg")

class Role

  attr_accessor :id, :movie_id, :actor_id, :fee

  def initialize(options)
    @id =         options["id"].to_i if options["id"]
    @movie_id =   options["movie_id"]
    @actor_id =   options["actor_id"]
    @fees =       options["fees"]
  end

  def save()
    sql = "
      INSERT INTO roles (movie_id, actor_id, fees)
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [@movie_id, @actor_id, @fees]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

end
