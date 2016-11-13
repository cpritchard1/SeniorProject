class XrfCocSample < ActiveRecord::Base
  belongs_to :xrf_coc

   validates :location, presence: :true
   validates :reading, presence: :true
end
