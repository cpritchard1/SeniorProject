class Subcontractor < ActiveRecord::Base
	has_many :jobs
	has_many :subcontractor_contacts

	validates :name, presence: :true, uniqueness: :true
	validates :phone, presence: :true
	validates :street, presence: :true
	validates :city, presence: :true
	validates :state, presence: :true 
	validates :zip, presence: :true
	validates :email, presence: :true 
	validates :website, presence: :true 
end
