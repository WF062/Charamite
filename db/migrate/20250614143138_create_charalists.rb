class CreateCharalists < ActiveRecord::Migration[7.1]
  def change
    create_table :charalists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chara, null: false, foreign_key: true

      t.timestamps
    end
  end
end
