class AddLastEditedByToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :last_edited_by, :string
  end
end
