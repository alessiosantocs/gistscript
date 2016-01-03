class AddPasswordToScript < ActiveRecord::Migration
  def change
    add_column :scripts, :password, :string
  end
end
