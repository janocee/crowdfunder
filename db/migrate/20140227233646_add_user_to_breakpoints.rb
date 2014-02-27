class AddUserToBreakpoints < ActiveRecord::Migration
  def change
  	add_column :breakpoints, :user_id, :integer
  end
end
