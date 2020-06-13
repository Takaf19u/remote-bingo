class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.text        :rand_number
      t.integer     :create_count, default: 0
      t.references  :user,     null: false,  foreign_key: true
      t.references  :group,    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
