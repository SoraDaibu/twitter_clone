class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :emai, unique:true
  end
end
