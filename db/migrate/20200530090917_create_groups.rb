class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string      :groupName,          null: false
      t.text        :rands
      t.string      :password_digest,    null: false
      t.references  :user,               null: false,  foreign_key: true
      t.timestamps
    end
    add_index :groups, :groupName,  unique: true
  end
end

