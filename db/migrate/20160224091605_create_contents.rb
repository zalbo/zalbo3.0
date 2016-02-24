class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :project_id
      t.integer :page_id
      t.string :text
      t.string :url_yt

      t.timestamps null: false
    end
  end
end
