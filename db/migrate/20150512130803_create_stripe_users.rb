class CreateStripeUsers < ActiveRecord::Migration
  def change
    create_table :stripe_users do |t|
      t.string :access_token
      t.boolean :livemode
      t.string :refresh_token
      t.integer :user_id
      t.string :stripe_user_id
      t.string :stripe_publishable_key
      t.string :email
      t.string :url
      t.string :country
      t.string :phone_number
      t.string :business_name
      t.string :business_type
      t.string :first_name
      t.string :last_name
      t.integer :dob_day
      t.integer :dob_month
      t.integer :dob_year
      t.string :city
      t.string :street_address
      t.string :city
      t.string :state
      t.string :currency

      t.timestamps null: false
    end
  end
end
