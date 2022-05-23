class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.last(6)
  end
end
