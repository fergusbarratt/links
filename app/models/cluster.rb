class Cluster < ActiveRecord::Base
  belongs_to :user
  has_many :links, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
end
