require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe '#actors_ordered' do
    it "can order its actors from youngest to oldest" do
      studio_1 = Studio.create({name: "1990 Studio"})
      movie_1 = studio_1.movies.create({name: "The Lion King",
                                      creation_year: "2003",
                                      genre: "Kids"})
      actor_1 = Actor.create({name: "Simba", age: "5"})
      actor_2 = Actor.create({name: "Nala", age: "4"})
      movie_1.actors << actor_1
      movie_1.actors << actor_2

      expect(movie_1.actors_ordered).to eq([actor_2, actor_1])
    end
  end

  describe "#average_actors_age" do
    it "can find actors average age" do
      studio_1 = Studio.create({name: "1990 Studio"})
      movie_1 = studio_1.movies.create({name: "The Lion King",
                                      creation_year: "2003",
                                      genre: "Kids"})
      actor_1 = Actor.create({name: "Simba", age: "5"})
      actor_2 = Actor.create({name: "Nala", age: "4"})
      movie_1.actors << actor_1
      movie_1.actors << actor_2

      expect(movie_1.average_actors_age).to eq(4.5)
    end
  end
end
