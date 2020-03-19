class ShelterPetsController < ApplicationController
  def index 
    @pets = Pet.all
    @shelter = Shelter.find(params[:id])
  end
end