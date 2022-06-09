class WelcomeController < ApplicationController
  layout 'home'

  def index
    @pets = Pet.all
    @pets_to_adopt = @pets.to_adopt.order(updated_at: :desc).take(6)
    @success_posts = Post.where(category_id: 11)
  end
end
