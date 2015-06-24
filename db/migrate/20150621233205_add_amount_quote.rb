class AddAmountQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :amount, :float
  end
end
