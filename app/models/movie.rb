class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_ordered
    Actor.order(:age)
  end

  def average_actors_age
    actors.average(:age)
  end
end
