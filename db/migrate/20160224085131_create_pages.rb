class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
