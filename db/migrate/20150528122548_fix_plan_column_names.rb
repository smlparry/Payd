class FixPlanColumnNames < ActiveRecord::Migration
  def change
    rename_column :plans, :period_type, :interval_type
    rename_column :plans, :period_amount, :interval_count
  end
end
