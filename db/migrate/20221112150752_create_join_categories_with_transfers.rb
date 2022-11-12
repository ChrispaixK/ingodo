class CreateJoinCategoriesWithTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :join_categories_with_transfers do |t|
      t.references :transfer, null: false, foreign_key: true
      t.references :category, null:false, foreign_key: true
      
      t.timestamps
    end
  end
end
