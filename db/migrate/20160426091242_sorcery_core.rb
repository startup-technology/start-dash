class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :crypted_password
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
