class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.integer :user_id
      t.integer :plan_id
      t.string :name
      t.string :email
      t.string :card

      t.timestamps null: false
    end
  end
end
