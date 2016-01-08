class Service < ActiveRecord::Base
  has_many :technicians #need to change this so it will understand User.technician
  has_many :appointments
  belongs_to :category

end
