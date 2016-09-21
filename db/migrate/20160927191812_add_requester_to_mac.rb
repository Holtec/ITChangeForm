class AddRequesterToMac < ActiveRecord::Migration
  def change
    add_column :macs, :requester, :text
  end
end
