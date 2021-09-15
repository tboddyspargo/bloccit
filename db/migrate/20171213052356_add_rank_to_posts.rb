class AddRankToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :rank, :float
  end
end
