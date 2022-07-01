class NotificationMailer < ApplicationMailer
  layout 'mailer'

  def user_created(user)
    @user = user
    mail to: user.email, subject: 'Welcome to FindMyPet'
  end

  def pet_lost
    @pet = params[:pet]
    @post = params[:post]
    mail to: User.all.pluck(:email), subject: default_i18n_subject
  end

  def pet_found
    @pet = params[:pet]
    @post = params[:post]
    mail to: User.all.pluck(:email), subject: 'Another pet found!'
  end

  def pet_to_adopt
    @pet = params[:pet]
    @post = params[:post]
    mail to: User.all.pluck(:email), subject: 'Another pet for adoption!'
  end

  def pet_home
    @pet = params[:pet]
    mail to: User.all.pluck(:email), subject: default_i18n_subject
  end

  def pet_adopted
    @pet = params[:pet]
    mail to: User.all.pluck(:email), subject: 'Pet is adopted!'
  end
end
