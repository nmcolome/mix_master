class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, foregin_key: true

      t.timestamps
    end
  end
end
