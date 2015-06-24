class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :number
      t.integer :total
      t.integer :mounth
      t.integer :year
      t.boolean :is_pais

      t.timestamps
    end
  end
end
