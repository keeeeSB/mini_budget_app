class CreateCategoryEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :category_entries do |t|
      t.references :category, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
