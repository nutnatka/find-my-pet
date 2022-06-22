module PetsHelper
  def age(pet)
    today = Date.today
    age = today.year - pet.date_of_birth.year
    age -= 1 if pet.date_of_birth.strftime('%m%d').to_i > today.strftime('%m%d').to_i
    age
  end
end

