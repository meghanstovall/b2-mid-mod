require 'rails_helper'

RSpec.describe "actors show page" do
  it "can see actors name, age, and a list of the movies they're in" do
    studio_1 = Studio.create({name: "1990 Studio"})
    movie_1 = studio_1.movies.create({name: "The Last Song",
                          creation_year: "2000",
                          genre: "Romantic"})
    movie_2 = studio_1.movies.create({name: "LOL",
                          creation_year: "2000",
                          genre: "Romantic"})
    actor_1 = Actor.create({name: "Miley Cyrus", age: "23"})
    actor_1.movies << movie_1
    actor_1.movies << movie_2

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_1.age)
    expect(page).to have_content(movie_1.name)
    expect(page).to have_content(movie_2.name)
  end
end
