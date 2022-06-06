class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.last(6)
    @post = Post.all
  end
end
