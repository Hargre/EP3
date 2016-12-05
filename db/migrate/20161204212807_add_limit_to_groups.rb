class AddLimitToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :limit, :string
  end
end
