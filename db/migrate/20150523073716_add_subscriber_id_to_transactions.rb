class AddSubscriberIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :subscriber_id, :integer
  end
end
