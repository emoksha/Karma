class Transaction < ActiveRecord::Base
  validates_presence_of :description, :user_id_giving, :user_id_receiving
end
