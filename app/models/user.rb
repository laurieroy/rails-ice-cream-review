class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_ice_creams, through: :reviews, source: :ice_cream
	has_many :ice_creams

	has_secure_password

	validates :username, uniqueness: true, presence :true
end
