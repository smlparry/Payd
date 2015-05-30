class AddColumnsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :stripe_created, :timestamp
    add_column :plans, :stripe_id, :string
    add_column :plans, :livemode, :boolean
    add_column :plans, :trial_period_days, :integer
    add_column :plans, :meta_data, :text, array:true, default: []
  end
end
