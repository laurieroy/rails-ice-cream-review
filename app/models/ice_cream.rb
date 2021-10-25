class IceCream < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :brand, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

  validates :flavor, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validate :not_a_duplicate

  def brand_attributes=(attributes)
    brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  def flavor_and_brand
    "#{flavor} - #{brand.name}"
  end

  def not_a_duplicate
    # if there is already an ice cream with that flavor && brand, throw an error
    ice_cream = IceCream.find_by(flavor: flavor, brand_id: brand_id)
    if !!ice_cream && ice_cream != self
      errors.add(:flavor, 'has already been added for that brand')
    end
  end
end
