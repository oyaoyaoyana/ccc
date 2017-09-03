class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|

      t.timestamps
      t.string :name, null: false, unique: true
    end
  end
end

