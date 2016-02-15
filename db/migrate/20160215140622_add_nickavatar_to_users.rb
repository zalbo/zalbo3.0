class AddNickavatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nick_avatar, :string
  end
end
