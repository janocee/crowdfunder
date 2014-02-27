class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
    	t.integer :pledge_amt
    	t.string :description
    	t.string :delivery

      t.timestamps
    end
  end
end
