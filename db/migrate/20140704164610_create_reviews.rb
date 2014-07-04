class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.string :review
      t.integer :rating

      t.references :item, index: true

      t.timestamps
    end
  end
end
