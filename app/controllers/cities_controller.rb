class CitiesController < ApplicationController
  def show
    puts "///////////////////"
    # puts params[:format]
    # @city = City.find(params[:format])
    @city = City.find(params[:id])
  end
end
