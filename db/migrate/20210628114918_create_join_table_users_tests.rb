class CreateJoinTableUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.index [:user_id, :test_id]
      t.index [:test_id, :user_id]
      
      t.timestamps
    end
  end
end
