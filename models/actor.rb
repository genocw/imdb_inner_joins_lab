class Actor

  attr_accessor :id, :f_name, :l_name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @f_name = options["f_name"]
    @l_name = options["l_name"]
  end

  def save()
    sql = "
      INSERT INTO actors (f_name, l_name)
      VALUES ($1, $2)
      RETURNING id;
    "
    values = [@f_name, @l_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def self.delete_all()
    sql = "
      DELETE FROM actors;
    "
    SqlRunner.run(sql)
  end

  def update()
    sql = "
      UPDATE actors
      SET (f_name, l_name) = ($1, $2)
      WHERE id = $3;
    "
    values = [@f_name, @l_name, @id]
    SqlRunner.run(sql, values)
  end

  def movies()
    # we have actor id
    sql = "
    SELECT movies.*
    FROM movies

    INNER JOIN roles
    ON movies.id = roles.movie_id

    WHERE roles.actor_id = $1;
    "
    values = [@id]
    results = SqlRunner.run(sql, values)
    movies = results.map { |movie_hash| Movie.new(movie_hash) }
    # return array of movie objects
  end

end
