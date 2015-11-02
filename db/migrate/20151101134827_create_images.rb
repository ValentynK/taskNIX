class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.float :price

      t.timestamps null: false
    end
  end
end
