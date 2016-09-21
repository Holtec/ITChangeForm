class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :mac, index: true, foreign_key: true
      t.text :saidby
      t.text :content

      t.timestamps null: false
    end
  end
end
