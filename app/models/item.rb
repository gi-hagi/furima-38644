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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_price
  belongs_to :area
  belongs_to :delivery_date

  validates :category, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_price, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date, numericality: { other_than: 1 , message: "can't be blank"}
end
