class Review < ApplicationRecord
  belongs_to :ice_cream
  belongs_to :user

  validates :title, presence: true
  validates :stars, numericality: { in: 0..6 }

end
