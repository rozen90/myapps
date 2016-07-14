class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date
      t.integer :sum
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
