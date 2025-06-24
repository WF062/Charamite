class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    # crypted_password や salt が既にあるなら、追加しない
    change_table :users do |t|
      t.string :crypted_password unless column_exists?(:users, :crypted_password)
      t.string :salt unless column_exists?(:users, :salt)
    end

    add_index :users, :email, unique: true unless index_exists?(:users, :email)
  end
end
