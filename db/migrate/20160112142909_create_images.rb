class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :id_project
      t.integer :id_page
      t.integer :id_content

      t.timestamps null: false
    end
  end
end
