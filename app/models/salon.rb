class Salon < ActiveRecord::Base
  has_many :technicians #need to change this so it will understand User.technician
  has_many :appointments, through: :technicians #need to change this so it will understand User.technician
  has_many :reviews, through: :technicians #need to change this so it will understand User.technician
end
