class AddUserIdToAdverts < ActiveRecord::Migration[6.1]
  def change
    add_reference :adverts, :user, null: false, foreign_key: true
  end
end
