class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @q = @user.pets.ransack(params[:q])
    @pets = @q.result.order(:name).page(params[:page]).per(5)
  end
end
