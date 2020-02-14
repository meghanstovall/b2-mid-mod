require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :creation}
    it {should validate_presence_of :year}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:actors).through(:actor_movies)}
  end
end
