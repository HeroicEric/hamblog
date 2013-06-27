class AddStateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :state, :string
  end
end
