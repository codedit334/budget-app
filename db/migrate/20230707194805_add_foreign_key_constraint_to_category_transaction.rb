class AddForeignKeyConstraintToCategoryTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :transaction_categories, :categories
    add_foreign_key :transaction_categories, :categories, on_delete: :cascade
  end
end
