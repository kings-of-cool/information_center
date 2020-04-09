class CreateInformationCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :information_centers do |t|
      t.string :name, null: false
      t.string :tel, null: false

      t.timestamps
    end
  end
end
