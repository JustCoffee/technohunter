class AddStatusToBids < ActiveRecord::Migration
  def change
    add_column :bids, :status, :integer
  end
end
