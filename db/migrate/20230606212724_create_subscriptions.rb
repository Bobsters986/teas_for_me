class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :title
      t.float :price
      t.integer :status, default: 0
      t.integer :frequency, default: 1

      t.timestamps
    end
  end
end
