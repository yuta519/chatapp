class User < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :father, foreign_key: { to_table: :users }
    add_reference :users, :mother, foreign_key: { to_table: :users }
  end
end
