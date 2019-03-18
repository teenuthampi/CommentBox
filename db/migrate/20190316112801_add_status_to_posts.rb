class AddStatusToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :status, :string,:default => "Active"
    add_column :comments, :status, :string,:default => "Active"
  end
end


