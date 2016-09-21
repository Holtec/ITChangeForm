class AddReasonsuccessToMac < ActiveRecord::Migration
  def change
    add_column :macs, :successreason, :text
    add_column :macs, :failreason, :text
  end
end
