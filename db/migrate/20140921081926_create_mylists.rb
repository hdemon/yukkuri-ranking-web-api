class CreateMylists < ActiveRecord::Migration
  def change
    create_table :mylists do |t|
      t.string :title
      t.integer :mylist_id
      t.text :description

      t.timestamps
    end
  end
end
