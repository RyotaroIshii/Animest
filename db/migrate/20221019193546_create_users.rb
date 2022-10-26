class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string  :uid
      t.string  :nickname
      t.string  :image
      t.string  :name
      t.integer :twitter_id       , null: false
      t.integer :acquisition_point, null: false
      t.string  :introdaction     , null: false

      t.timestamps
    end
  end
end
