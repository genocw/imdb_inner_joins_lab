require_relative("models/actor.rb")
require_relative("models/movie.rb")
require_relative("models/role.rb")
require("pry")

Actor.delete_all()
Movie.delete_all()

actor1 = Actor.new({
  "f_name" => "Edward",
  "l_name" => "Norton"
  })
actor2 = Actor.new({
  "f_name" => "Brad",
  "l_name" => "Pitt"
  })
actor3 = Actor.new({
  "f_name" => "Maggie",
  "l_name" => "Gyllenhaal"
  })

actor1.save()
actor2.save()
actor3.save()

movie1 = Movie.new({
  "title" => "Fight Club",
  "genre" => "Psychological Thriller/Family Fun"
  })
movie2 = Movie.new({
  "title" => "Secretary",
  "genre" => "Comedy/Drama"
  })
movie3 = Movie.new({
  "title" => "Se7en",
  "genre" => "Crime"
  })

movie1.save()
movie2.save()
movie3.save()

actor1.f_name = "Ed"
actor1.update

binding.pry
nil
