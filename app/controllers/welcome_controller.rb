class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.all
    @pets_to_adopt = @pets.to_adopt.order(created_at: :desc).take(6)
    @success_posts = Post.where(category_id: 11)
    @lost_posts = Post.where(category_id: 8).order(created_at: :desc).take(3)
  end
end
