class XrfCoc < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  has_many :xrf_coc_samples
  has_many :lead_reports
  has_many :lead_report_negs
end
