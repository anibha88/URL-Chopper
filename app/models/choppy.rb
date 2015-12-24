class Choppy < ActiveRecord::Base
  validates :actual_url, presence: true
  validates_format_of :actual_url, with: URI::regexp(%w(http https))
  validates_uniqueness_of :shortened_url, case_sensitive: false
end
