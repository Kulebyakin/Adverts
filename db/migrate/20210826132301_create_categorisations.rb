class CreateCategorisations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorisations do |t|
      t.references :advert, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps

    end

    add_index :hashtagisation, [:advert_id, :hashtag_id], unique: true
  end
end
