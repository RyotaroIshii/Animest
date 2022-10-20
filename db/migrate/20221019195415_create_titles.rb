class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|

      t.integer :user_id   , null: false
      t.integer :need_point, null: false
      t.string  :title     , null: false

      t.timestamps
    end
  end
end