class MycometerCoc < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  has_many :mycometer_coc_samples

  validates :ambient_temp, presence: :true
  validates :liters_minute, presence: :true
  validates :duration, presence: :true
end
