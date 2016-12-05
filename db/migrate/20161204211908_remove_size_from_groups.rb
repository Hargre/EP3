class RemoveSizeFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :size, :integer
  end
end
