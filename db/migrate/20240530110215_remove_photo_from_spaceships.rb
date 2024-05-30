class RemovePhotoFromSpaceships < ActiveRecord::Migration[7.1]
  def change
    remove_column :spaceships, :photo, :string
  end
end
