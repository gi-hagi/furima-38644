class Order < ApplicationRecord
  belongs_to :management

  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :area_id,   presence: true
  validates :city,      presence: true
  validates :address,   presence: true
  validates :phone,     presence: true, format: { with: /\A\d{10,11}\z/ }
end
