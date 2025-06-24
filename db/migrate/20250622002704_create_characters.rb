class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.string :tags
      t.string :background_color
      t.string :image

      t.timestamps
    end
  end
end
