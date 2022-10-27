class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string  :uid
      t.string  :nickname
      t.string  :image
      t.string  :name
      t.integer :acquisition_point, null: false, default: 0
      t.string  :introdaction     , null: false

      t.timestamps
    end
  end
end
