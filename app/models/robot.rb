class Robot < ApplicationRecord
  belongs_to :user
  has_many :logs
  has_and_belongs_to_many :parts 

  validates :name, presence: true 
end
