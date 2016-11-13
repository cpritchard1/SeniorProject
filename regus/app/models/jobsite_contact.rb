class JobsiteContact < ActiveRecord::Base
  # belongs_to :jobsite
  # has_many :jobs

  	validates :name, presence: :true, uniqueness: :true
  	validates :phone, presence: :true
  	validates :email, presence: :true
end
