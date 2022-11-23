class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.decimal :tax
      t.string :ship_to
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.integer :status, default: 0
      t.references :user, optional: true

      t.timestamps
    end
  end
end
