class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string  :uid
      t.string  :nickname
      t.string  :image
      t.string  :name
      t.string  :avatar
      t.string  :title
      t.string  :description
      t.integer :acquisition_point, null: false, default: 0

      t.timestamps
    end
  end
end
