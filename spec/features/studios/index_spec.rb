require 'rails_helper'

RSpec.describe "studio index page" do
  it "can see list of studios and all of their movies" do
    studio_1 = Studio.create({name: "1990 Studio"})
    studio_2 = Studio.create({name: "The Best Studio"})
    studio_3 = Studio.create({name: "The New Studio"})
    movie_1 = studio_1.movies.create({name: "The Last Song",
                                    creation_year: "2000",
                                    genre: "Romantic"})
    movie_2 = studio_1.movies.create({name: "The Lion King",
                                    creation_year: "2003",
                                    genre: "Kids"})
    movie_3 = studio_2.movies.create({name: "Aladin",
                                    creation_year: "2008",
                                    genre: "Kids"})
    visit "/studios"

    within "#studio-#{studio_1.id}" do
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)
    end

    within "#studio-#{studio_2.id}" do
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content(movie_3.name)
    end

    within "#studio-#{studio_3.id}" do
      expect(page).to have_content(studio_3.name)
    end
  end
end
