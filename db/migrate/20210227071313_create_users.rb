class CreateUsers < ActiveRecord::Migration[ 5.2 ]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, unique: true
      t.integer :role, default: 1

      t.timestamps
    end
  end
end
