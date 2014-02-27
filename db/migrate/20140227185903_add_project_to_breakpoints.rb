class AddProjectToBreakpoints < ActiveRecord::Migration
  def change
  	add_column :breakpoints, :project_id, :integer
  end
end
