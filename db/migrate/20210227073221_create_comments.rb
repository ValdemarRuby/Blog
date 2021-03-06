class CreateComments < ActiveRecord::Migration[ 5.2 ]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :message, null: false, default: ''

      t.timestamps
    end
  end
end
