class AddTrialToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :trial, :boolean
  end
end
