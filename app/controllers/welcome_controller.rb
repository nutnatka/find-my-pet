class WelcomeController < ApplicationController
  def index
    @pets = Pet.last(6)
  end
end
