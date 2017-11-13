class SorceryExternal < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.integer :user_id, null: false
      t.string :provider, nill: false
      t.string :uid, null: false
      t.timestamps
    end

    add_index :authentications, %i[provider uid]
  end
end
