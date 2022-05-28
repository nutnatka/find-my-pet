class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, except: [:index]
  before_action :set_pet, only: %i[edit update show find_pet adopt_pet]

  def index
    @q = Pet.ransack(params[:q])
    @pets = @q.result.order(:name).page params[:page]
  end

  def show; end

  def create
    @pet = @user.pets.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to user_path(current_user), notice: 'The pet has been added.'
    else
      redirect_to user_path(current_user), notice: 'The pet failed to be created.'
    end
  end

  def edit; end

  def update
    if current_user.id == @user.id
      if @pet.update(pet_params)
        redirect_to user_path(current_user), notice: 'The pet has been updated.'
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @user.id
      @pet = @user.pets.friendly.find(params[:id])
      @pet.destroy

      respond_to do |format|
        format.js { render layout: false }
      end
    end
  end

  def find_pet
    if current_user.id == @user.id
      @pet.home_again!
      @pet.posts = @pet.posts.where(category: 'lost_pets').or(@pet.posts.where(category: 'found_pets'))
      @pet.posts.destroy
      redirect_to @user, notice: "The pet has been found! You can share the success story by click on the 'Share Success Story' button."
    end
  end

  def adopt_pet
    if current_user.id == @user.id
      @pet.adopted!
      @pet.posts = @pet.posts.where(category: 'pets_to_adopt')
      @pet.posts.destroy
      redirect_to @user, notice: "The pet has found its family! You can share the success story by click on the 'Share Success Story' button."
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:user_id, :name, :species, :breed, :sex, :sterilized, :date_of_birth, :color, :additional_info, :avatar)
  end

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def set_pet
    @pet = Pet.friendly.find(params[:id])
  end
end
