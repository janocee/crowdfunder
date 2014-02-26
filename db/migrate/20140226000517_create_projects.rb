class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :title
    	t.string :description
    	t.integer :pledged
    	t.datetime :start_time
    	t.datetime :end_time

      t.timestamps
    end
  end
end
