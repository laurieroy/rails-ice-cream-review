class CreateIceCreams < ActiveRecord::Migration[6.1]
  def change
    create_table :ice_creams do |t|
      t.string :flavor
      t.text :description
      t.belongs_to :brand, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
