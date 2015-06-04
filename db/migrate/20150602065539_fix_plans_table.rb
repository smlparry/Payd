class FixPlansTable < ActiveRecord::Migration
  def change
    rename_column :plans, :stripe_id, :uid
  end
end
