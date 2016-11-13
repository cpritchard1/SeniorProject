class SubcontractorContact < ActiveRecord::Base
  # belongs_to :subcontractor

    validates :name, presence: :true, uniqueness: :true
  	validates :phone, presence: :true
  	validates :email, presence: :true
end
