class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.last(5)
  end
end
