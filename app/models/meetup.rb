class Meetup < ActiveRecord::Base
  has_many :members
  has_many :comments
  has_many :users, through: :members
  belongs_to :user
end
