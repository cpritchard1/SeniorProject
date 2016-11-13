class CompanyContact < ActiveRecord::Base
  # belongs_to :company

  	validates :name, presence: :true, uniqueness: :true
  	validates :phone, presence: :true
  	validates :email, presence: :true
end
