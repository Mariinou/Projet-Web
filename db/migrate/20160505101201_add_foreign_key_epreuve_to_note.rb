class AddForeignKeyEpreuveToNote < ActiveRecord::Migration
  def self.up
  	change_table :notes do |t|
  		t.references :epreuve, index: true, foreign_key: true
  	end
  end
end