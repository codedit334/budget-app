class AddForeignKeyConstraintToItsTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :transaction_categories, :its_transactions
    add_foreign_key :transaction_categories, :its_transactions, on_delete: :cascade
  end
end
