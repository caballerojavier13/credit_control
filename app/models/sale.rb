class Sale < ActiveRecord::Base
  belongs_to :person
  validates :person_id, :presence => true
  validates :date, :presence => true
  validates :description, :presence => true
end
