class FixStripeUsers < ActiveRecord::Migration
  def change
    add_column :stripe_users, :currencies_supported, :text, array:true, default: []
    add_column :stripe_users, :timezone, :text
    add_column :stripe_users, :charge_enabled, :boolean

    rename_column :stripe_users, :first_name, :name
    rename_column :stripe_users, :business_type, :business_logo
    rename_column :stripe_users, :url, :business_url
    rename_column :stripe_users, :currency, :default_currency

    remove_column :stripe_users, :last_name
    remove_column :stripe_users, :city
    remove_column :stripe_users, :street_address
    remove_column :stripe_users, :state
    remove_column :stripe_users, :dob_day
    remove_column :stripe_users, :dob_month
    remove_column :stripe_users, :dob_year
  end
end
