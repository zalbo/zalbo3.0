class AddPresentImageToContents < ActiveRecord::Migration
  def change
    add_column :contents, :present_image, :boolean
  end
end
