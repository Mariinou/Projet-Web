class CreateUsersMatieres < ActiveRecord::Migration
  def change
    create_table :users_matieres do |t|
      t.belongs_to :user, index: true
      t.belongs_to :matiere, index: true
      t.timestamps null: false
    end
  end
end
