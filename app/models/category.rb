class Category < ApplicationRecord
	has_many :stuffs
	validates :name, presence: true, uniqueness: true
end
