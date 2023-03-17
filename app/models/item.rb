class Item < ApplicationRecord
  belongs_to :user
  has_one :management
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :concept, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_price_id, presence: true
  validates :area_id, presence: true
  validates :delivery_date_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_price
  belongs_to :area
  belongs_to :delivery_date

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_price_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
