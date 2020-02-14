class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])

    if params[:name] != nil
      @name = params[:name]
    end
  end
end
