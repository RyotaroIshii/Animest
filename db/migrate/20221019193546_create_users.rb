class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string  :uid              , null: false
      t.string  :nickname         , null: false
      t.string  :image            , null: false
      t.string  :name             , null: false
      t.string  :avatar
      t.integer :title
      t.string  :description      , null: false
      t.integer :acquisition_point, null: false, default: 0

      t.timestamps
    end
  end
end
