class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :static
  has_many :comments
  validates_presence_of :description, :location
  validates_numericality_of :units, :message => "Please enter a non-decimal integer"
end
