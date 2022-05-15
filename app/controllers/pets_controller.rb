class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, except: [:index]
  before_action :set_pet, only: %i[edit update show]

  def index
    @q = Pet.ransack(params[:q])
    @pets = @q.result.page params[:page]
  end

  def show; end

  def create
    @pet = @user.pets.create(pet_params.merge(user_id: current_user.id))

    redirect_to user_path(current_user), notice: 'The pet has been added.' if @pet.save
  end

  def edit; end

  def update
    if @pet.update(pet_params)
      redirect_to user_path(current_user), notice: 'The pet has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet = @user.pets.friendly.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.js { render layout: false }
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
