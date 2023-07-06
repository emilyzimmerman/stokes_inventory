class Part < ApplicationRecord
    has_and_belongs_to_many :robots 

    validates :name, presence: true 
end
