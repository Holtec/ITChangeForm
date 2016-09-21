class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.text :name
      t.text :location

      t.timestamps null: false
    end
  end
end
