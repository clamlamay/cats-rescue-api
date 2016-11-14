class Dogs < ActiveRecord::Migration[5.0]
  def change
  	create_table :dogs do |table|
  		table.string :name
  		table.string :note
  		table.string :img
  	end
  end
end
