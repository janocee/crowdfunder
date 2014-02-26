class AddColumnsToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :image, :string
  	add_column :projects, :category, :string
  	add_column :projects, :goal, :integer
  end
end
