class CreateMatieres < ActiveRecord::Migration
  def change
    create_table :matieres do |t|
      t.string :titre
      t.date :debut
      t.date :fin
      t.references :enseignant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
