class AddStatusToMac < ActiveRecord::Migration
  def change
    add_column :macs, :status, :text
  end
end
