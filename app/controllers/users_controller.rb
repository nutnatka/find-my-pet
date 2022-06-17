class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @q = @user.pets.ransack(params[:q])
    @pets = @q.result.order(:created_at).page(params[:page]).per(5)

    redirect_to @user if @q.result.page(params[:page]) == 0
  end
end
