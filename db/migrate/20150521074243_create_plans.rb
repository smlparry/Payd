class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.string :name
      t.integer :period_amount
      t.string :period_type
      t.integer :amount

      t.timestamps null: false
    end
  end
end
