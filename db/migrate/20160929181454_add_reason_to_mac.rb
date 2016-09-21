class AddReasonToMac < ActiveRecord::Migration
  def change
    add_column :macs, :reason, :text
  end
end
