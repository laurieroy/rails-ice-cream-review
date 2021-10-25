class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_ice_creams, through: :reviews, source: :ice_cream
	has_many :ice_creams

	has_secure_password

	validates :username, uniqueness: true, presence: true

	def self.create_google_oa(auth)
		self.find_or_create_by(username: auth[:info][:email]) do |u|
			u.password = SecureRandom.hex
		end
	end

	# say add in another social login but depends on where point of separation is, but return same

end
