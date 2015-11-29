class Link < ActiveRecord::Base
  validates_presence_of(:url)
  validates_presence_of(:name)
  belongs_to :cluster
end
