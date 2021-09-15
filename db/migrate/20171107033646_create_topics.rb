class CreateTopics < ActiveRecord::Migration[4.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :public, default: true
      t.text :description

      t.timestamps null: false
    end
  end
end
