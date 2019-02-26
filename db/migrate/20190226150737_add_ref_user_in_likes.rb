class AddRefUserInLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user
  end
end
