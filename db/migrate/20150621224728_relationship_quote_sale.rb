class RelationshipQuoteSale < ActiveRecord::Migration
  def change
    add_column :sales, :description, :string

    add_column :quotes, :sale_id, :integer, :references => 'sales'

  end
end
