class AddForeignKeyMatiereToUsers < ActiveRecord::Migration
  def self.up
  	change_table :users do |t|
  		t.references :matiere, index: true, foreign_key: true
  	end
  end
end
