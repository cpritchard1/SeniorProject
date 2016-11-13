class Jobsite < ActiveRecord::Base
	has_many :jobs 
	has_many :jobsite_contacts

	validates :name, presence: :true, uniqueness: :true
	validates :street, presence: :true
	validates :city, presence: :true
	validates :state, presence: :true
	validates :zip, presence: :true

	geocoded_by :full_address
	after_validation :geocode, if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }
end
