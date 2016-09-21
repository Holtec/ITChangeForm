class CreateMacs < ActiveRecord::Migration
  def change
    create_table :macs do |t|
      t.text :what
      t.text :why
      t.text :how
      t.text :success
      t.text :rollback
      t.text :division
      t.text :createdby

      t.timestamps null: false
    end
  end
end
