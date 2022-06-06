class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.all
    @pets_to_adopt = @pets.to_adopt.last(6)
    @users = User.all
  end
end
