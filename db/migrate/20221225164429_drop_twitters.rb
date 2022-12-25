class DropTwitters < ActiveRecord::Migration[6.1]
  def change
    drop_table :twitters do |t|

    end
  end
end
