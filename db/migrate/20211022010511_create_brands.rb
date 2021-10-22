class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.boolean :in_grocery

      t.timestamps
    end
  end
end
