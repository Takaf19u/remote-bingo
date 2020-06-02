class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.strihg :groupName,   null: false
      t.strihg  :password,   null: false
      t.references  :user,   null: false,  foreign_key: true
      t.timestamps
    end
  end
end
