class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|

      t.integer :user_id      , null: false
      t.integer :change_count , null: false, default: 0

      t.timestamps
    end
  end
end
