class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.all
    @pets_to_adopt = @pets.to_adopt.order(created_at: :desc).take(6)
    @success_posts = Post.with_success_stories.where(status: 'published').order(created_at: :desc).take(10)
    @lost_posts = Post.with_lost_pet.order(created_at: :desc).take(3)
  end
end
