class AddAmountToStuff < ActiveRecord::Migration[7.1]
  def change
    add_column :stuffs, :amount, :integer, default: 1
  end
end
