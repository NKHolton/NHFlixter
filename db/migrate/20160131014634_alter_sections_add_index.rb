class AlterSectionsAddIndex < ActiveRecord::Migration
  def change
  	add_index :sections, :row_order
  end
end
