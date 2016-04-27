class CreateEnseignants < ActiveRecord::Migration
  def change
    create_table :enseignants do |t|

      t.timestamps null: false
    end
  end
end
