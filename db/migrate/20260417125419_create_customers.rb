class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :furigana
      t.date :birth_date
      t.string :status
      t.string :product

      t.timestamps
    end
  end
end
