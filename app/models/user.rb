class User < ApplicationRecord
	has_many :gardens
	has_many :plants, through: :gardens
	has_secure_password
	validates :name, presence: true, uniqueness: true
	validates :password, presence: true
end
