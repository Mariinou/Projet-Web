class CreateMatieres < ActiveRecord::Migration
  def change
    create_table :matieres do |t|

      t.timestamps null: false
    end
  end
end
