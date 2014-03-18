class CreateVideo < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text   :description
      t.string :small_cover_image
      t.string :large_cover_image

      t.timestamps
    end
  end
end
