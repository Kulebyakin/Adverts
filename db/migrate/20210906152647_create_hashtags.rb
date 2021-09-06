class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
