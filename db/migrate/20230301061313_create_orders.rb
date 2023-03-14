class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string      :post_code,   null: false
      t.integer     :area_id,     null: false
      t.string      :city,        null: false
      t.string      :address,      null: false
      t.string      :build
      t.string      :phone,       null: false
      t.references  :management,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
