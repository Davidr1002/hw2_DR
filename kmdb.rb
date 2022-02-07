# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
People.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model

#rails generate model People
    #t.string :name
#rails db:migrate

#rails generate model Movie
    #t.string :title
    #t.string :year_released
    #t.string :rated
    #t.integer :director_id
#rails db:migrate

#rails generate model Role
    #t.integer :movie_id
    #t.integer :actor_id
    #t.string :character_name
#rails db:migrate

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.

movie1 = Movie.new
movie1.title = "Batman Begins"
movie1.year_released = "2005"
movie1.rated = "PG-13"
movie1.person_id = christopher_nolan.id
movie1.save

movie2 = Movie.new
movie2.title = "The Dark Knight"
movie2.year_released = "2008"
movie2.rated = "PG-13"
movie2.director_id = "1"
movie2.save

movie3 = Movie.new
movie3.title = "The Dark Knight Rises"
movie3.year_released = "2012"
movie3.rated = "PG-13"
movie3.director_id = "1"
movie3.save

christopher_nolan = Person.new
christopher_nolan.name = "Christian Nolan"
christopher_nolan.save

christian_bale = Person.new
christian_bale.name = "Christian Bale"
christian_bale.save

michael_caine = Person.new
michael_caine.name = "Michael Caine"
michael_caine.save

liam_neeson = Person.new
liam_neeson.name = "Liam Neeson"
liam_neeson.save

katie_holmes = Person.new
katie_holmes.name = "Katie Holmes"
katie_holmes.save

gary_oldman = Person.new
gary_oldman.name = "Gary Oldman"
gary_oldman.save

heath_ledger = Person.new
heath_ledger.name = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Person.new
aaron_eckhart.name = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhaal = Person.new
maggie_gyllenhaal.name = "Maggie Gyllenhaal"
maggie_gyllenhaal.save

tom_hardy = Person.new
tom_hardy.name = "Tom Hardy"
tom_hardy.save

joseph_gordon_levitt = Person.new
joseph_gordon_levitt.name = "Joseph Gordon-Levitt"
joseph_gordon_levitt.save

anna_hathaway = Person.new
anna_hathaway.name = "Anne Hathaway"
anna_hathaway.save


#movie = Movie.where({title: "Batman Begins"})[0]
#person = Person.where({name: "Christian Bale"})[0]
#values = {
#  movie_id: movie.id,
#  actor_id: person.id,
 # character_name = "Bruce Wayne"
#}

#movie = Movie.new(values)
#movie.save


# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

#movies = Movie.all
#for movie in movies
 #   puts "#{movie.title} - #{movie.year_released} - #{movie.rated} "
#end


movies = Movie.all
for movie in movies
    director = Person.where({id: movie.person_id})[0]
    puts "#{movie.title} #{movie.year_released} #{movie.rated} #{director.name}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!


#movies = Movie.all
#for movie in movies
    # company = Company.where(id: contact.company_id)[0]
 #   movie = movie.person
  #  person = person.role
   # puts "#{movie.title} #{person.name} - #{role.character_name}"
#end