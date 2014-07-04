class ChangeIntegerToString < ActiveRecord::Migration
  def change
    remove_column :reviews, :rating
    add_column :reviews, :rating, :string
  end
end
