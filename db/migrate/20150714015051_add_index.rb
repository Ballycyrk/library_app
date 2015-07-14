class AddIndex < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :books, :title
    add_index :books, :author_last
  end
end
