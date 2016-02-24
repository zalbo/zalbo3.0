class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :id_project
      t.integer :id_page
      t.string :text
      t.string :url_yt

      t.timestamps null: false
    end
  end
end
