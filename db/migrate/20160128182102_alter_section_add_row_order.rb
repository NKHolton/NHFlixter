class AlterSectionAddRowOrder < ActiveRecord::Migration
  def change
  	   add_column :section, :row_order, :integer
       add_index :section, :row_order
  end
end
