class ManagementForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :build, :phone, :user_id, :item_id

  with_options presence: true do
    validates :post_code
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :phone
    validates :user_id
    validates :item_id
  end

  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, area_id: area_id, city: city, address: address, build: build, phone: phone, management_id: management.id)
  end
end