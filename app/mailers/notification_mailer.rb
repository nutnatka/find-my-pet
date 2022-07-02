class NotificationMailer < ApplicationMailer
  before_action :set_users, except: :user_created
  before_action :set_pet, except: :user_created
  before_action :set_post, only: %i[pet_lost pet_found pet_to_adopt]
  layout 'mailer'

  def user_created(user)
    @user = user
    mail to: user.email, subject: default_i18n_subject
  end

  def pet_lost
    mail to: @users.all.pluck(:email), subject: default_i18n_subject unless @users.blank?
  end

  def pet_found
    mail to: @users.all.pluck(:email), subject: default_i18n_subject unless @users.blank?
  end

  def pet_to_adopt
    mail to: @users.all.pluck(:email), subject: default_i18n_subject unless @users.blank?
  end

  def pet_home
    mail to: @users.all.pluck(:email), subject: default_i18n_subject unless @users.blank?
  end

  def pet_adopted
    mail to: @users.all.pluck(:email), subject: default_i18n_subject unless @users.blank?
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
