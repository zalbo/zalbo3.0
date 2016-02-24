class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :id_project

      t.timestamps null: false
    end
  end
end
