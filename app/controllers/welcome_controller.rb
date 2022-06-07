class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.all
    @pets_to_adopt = @pets.to_adopt.order(updated_at: :desc).take(6)
  end
end
