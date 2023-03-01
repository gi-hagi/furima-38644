class Order < ApplicationRecord
  belongs_to :management

  validates :post_code, presence: true
  validates :area_id,   presence: true
  validates :city,      presence: true
  validates :address,   presence: true
  validates :build,     presence: true
  validates :phone,     presence: true
end
