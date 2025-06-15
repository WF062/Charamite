class CreateCharas < ActiveRecord::Migration[7.1]
  def change
    create_table :charas do |t|
      t.string :charaname
      t.string :backtext
      t.text :maintext
      t.string :image

      t.timestamps
    end
  end
end
