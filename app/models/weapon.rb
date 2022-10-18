class Weapon < ApplicationRecord
  belongs_to :weapon_category
  has_many :weapon_purchases
  has_many :weapon_damages
end
