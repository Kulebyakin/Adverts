class CreateAdverts < ActiveRecord::Migration[6.1]
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.string :images
      t.string :status

      t.timestamps
    end
  end
end
