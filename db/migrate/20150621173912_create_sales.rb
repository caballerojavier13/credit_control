class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :person, index: true
      t.date :date

      t.timestamps
    end
  end
end
