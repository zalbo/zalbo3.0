class AddOrderToContents < ActiveRecord::Migration
  def change
    add_column :contents, :order, :integer
  end
end
