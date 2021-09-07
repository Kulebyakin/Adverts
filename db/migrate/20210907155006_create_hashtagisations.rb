class CreateHashtagisations < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtagisations do |t|
      t.references :advert, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
