class Appointment < ActiveRecord::Base
  belongs_to :technician
  belongs_to :user
  has_one :service
  accepts_nested_attributes_for :service

  extend TimeSplitter::Accessors
  split_accessor :starts_at
end
