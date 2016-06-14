class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  acts_as_votable
end
