class AddScheduleToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :schedule, :string
  end
end
