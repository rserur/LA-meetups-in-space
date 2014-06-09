class Meetup < ActiveRecord::Base
  has_many :members
  has_many :comments
  belongs_to :user
end
