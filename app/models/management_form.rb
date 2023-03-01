class ManagementForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :build, :phone, :user_id, :item_id

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :city
    validates :address
    validates :build
    validates :phone
    validates :user_id #management
    validates :item_id #management
  end

  def save
    Order.create(post_code: post_code, area_id: area_id, city: city, adress: adress, build: build, phone: phone)
    Management.create(user_id: user_id, item_id: item_id)
  end
end