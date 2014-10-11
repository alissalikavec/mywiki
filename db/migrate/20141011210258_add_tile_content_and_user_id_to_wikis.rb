class AddTileContentAndUserIdToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :title, :string
    add_column :wikis, :content, :string
    add_column :wikis, :user_id, :integer
  end
end
