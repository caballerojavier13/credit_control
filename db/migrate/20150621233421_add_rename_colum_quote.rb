class AddRenameColumQuote < ActiveRecord::Migration
  def change
    rename_column :quotes, :is_pais, :is_paid
  end
end
