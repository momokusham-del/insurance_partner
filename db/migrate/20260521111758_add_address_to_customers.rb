class AddAddressToCustomers < ActiveRecord::Migration[8.1]
  def change
    add_column :customers, :address, :string
  end
end
