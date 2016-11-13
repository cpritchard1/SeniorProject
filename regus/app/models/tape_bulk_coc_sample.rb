class TapeBulkCocSample < ActiveRecord::Base
  belongs_to :tape_bulk_coc
  has_one :spore_type_count
  
  validates :location, presence: :true
end

