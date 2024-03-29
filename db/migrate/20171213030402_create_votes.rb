class CreateVotes < ActiveRecord::Migration[4.2]
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
