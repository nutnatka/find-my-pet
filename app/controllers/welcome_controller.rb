class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.all
    @users = User.all
  end
end
