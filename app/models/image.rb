class Image < ActiveRecord::Base
  belongs_to :drink
  validates :url, presence: true
end
