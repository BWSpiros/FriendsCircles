class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.integer :user_id, null: false
      t.string :reset_token, null: false

      t.timestamps
    end

    add_index :password_resets, :user_id
  end
end
