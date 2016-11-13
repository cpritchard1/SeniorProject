class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  belongs_to :subcontractor
  belongs_to :jobsite
  belongs_to :company_contact
  belongs_to :subcontractor_contact
  belongs_to :jobsite_contact
  has_many :xrf_cocs
  has_many :tape_bulk_cocs
  
  validates :company_id, presence: :true
  validates :subcontractor_id, presence: :true
  validates :jobsite_id, presence: :true
  validates :company_contact_id, presence: :true
  validates :subcontractor_contact_id, presence: :true
  validates :jobsite_contact_id, presence: :true

 	def self.search(search)
  		where("id LIKE ?", "%#{search}%") 
	end
end
