class AddDefaultPhotoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :default_photo, :integer
  end
end
