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

role1 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor1.id,
  "fees"      => 1000000
  })
role2 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor2.id,
  "fees"      => 2000000
  })
role3 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor3.id,
  "fees"      => 3000000
  })
role4 = Role.new({
  "movie_id" => movie3.id,
  "actor_id" => actor2.id,
  "fees"      => 4000000
  })

role1.save()
role2.save()
role3.save()
role4.save()

binding.pry
nil
