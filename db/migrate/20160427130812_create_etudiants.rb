class CreateEtudiants < ActiveRecord::Migration
  def change
    create_table :etudiants do |t|

      t.timestamps null: false
    end
  end
end
