require 'rails_helper'

RSpec.describe "movie show page" do
  it "can see movie name, creation year, genre, and actors list from youngest to oldest and average age of actors" do
    studio_1 = Studio.create({name: "1990 Studio"})
    movie_1 = studio_1.movies.create({name: "The Lion King",
                                    creation_year: "2003",
                                    genre: "Kids"})
    actor_1 = Actor.create({name: "Simba", age: "5"})
    actor_2 = Actor.create({name: "Nala", age: "4"})
    movie_1.actors << actor_1
    movie_1.actors << actor_2

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.name)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)

    expect(page).to have_content("Actors Youngest to Oldest:")
    expect(page).to have_content(actor_2.name)
    expect(page).to have_content(actor_1.name)
    expect(page).to have_content("Average Actors Age: 4.5")
  end

  it "can see form for an actors name" do
    studio_1 = Studio.create({name: "1990 Studio"})
    movie_1 = studio_1.movies.create({name: "The Lion King",
                                    creation_year: "2003",
                                    genre: "Kids"})
    actor_1 = Actor.create({name: "Simba", age: "5"})
    actor_2 = Actor.create({name: "Nala", age: "4"})
    movie_1.actors << actor_1
    movie_1.actors << actor_2

    visit "/movies/#{movie_1.id}"

    fill_in 'name', with: "Simba"
    click_on "Enter"
    expect(current_path).to eq("/movies/#{movie_1.id}")

    expect(page).to have_content("Simba")
  end
end
