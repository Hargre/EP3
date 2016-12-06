class AddMatchedToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :matched, :boolean, default: false, null: false
  end
end
