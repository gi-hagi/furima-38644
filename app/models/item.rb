class Item < ApplicationRecord
  belongs_to :user
  # has_one :management

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_price_id, presence: true
  validates :area_id, presence: true
  validates :delivery_date_id, presence: true
  validates :price, presence: true
end
