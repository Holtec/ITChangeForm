class AddWhenToMac < ActiveRecord::Migration
  def change
    add_column :macs, :when, :text
  end
end
