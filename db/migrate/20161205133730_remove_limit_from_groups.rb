class RemoveLimitFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :limit, :string
  end
end
