class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.boolean :status
      t.decimal :tax, default: 0

      t.timestamps
    end
  end
end
