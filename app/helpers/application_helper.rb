module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def success_pets_count(pets)
    pets.adopted.count + pets.home_again.count + pets.master_found.count
  end
end
