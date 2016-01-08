class Appointment < ActiveRecord::Base
  belongs_to :technician #need to change this so it will understand User.technician
  belongs_to :user #need to change this so it will understand User.client
  has_one :service
  accepts_nested_attributes_for :service

  extend TimeSplitter::Accessors
  split_accessor :starts_at
end
