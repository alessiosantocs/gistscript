class AddUserInfoToScript < ActiveRecord::Migration
  def change
    add_column :scripts, :user_info, :text
  end
end
