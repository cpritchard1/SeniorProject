class TapeBulkCoc < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  has_many :tape_bulk_coc_samples
end
