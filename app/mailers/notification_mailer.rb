class NotificationMailer < ApplicationMailer
  before_action :set_users, except: :user_created
  before_action :set_pet, except: :user_created
  before_action :set_post, only: %i[pet_lost pet_found pet_to_adopt]
  layout 'mailer'

  def user_created(user)
    @user = user
    mail to: user.email, subject: 'Welcome to FindMyPet'
  end

  def pet_lost
    unless @users.blank?
      mail to: @users.all.pluck(:email), subject: default_i18n_subject
    end
  end

  def pet_found
    unless @users.blank?
      mail to: @users.all.pluck(:email), subject: 'Another pet found!'
    end
  end

  def pet_to_adopt
    unless @users.blank?
      mail to: @users.all.pluck(:email), subject: 'Another pet for adoption!'
    end
  end

  def pet_home
    unless @users.blank?
      mail to: @users.all.pluck(:email), subject: default_i18n_subject
    end
  end

  def pet_adopted
    unless @users.blank?
      mail to: @users.all.pluck(:email), subject: 'Pet is adopted!'
    end
  end

  private

  def set_users
    @users = params[:users]
  end

  def set_pet
    @pet = params[:pet]
  end

  def set_post
    @post = params[:post]
  end
end

