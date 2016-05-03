class CreateEpreuves < ActiveRecord::Migration
  def change
    create_table :epreuves do |t|

    	t.date :date
    	t.string :titre
    	t.references :matiere, index: true, foreign_key: true

        t.timestamps null: false
    end
  end
end
