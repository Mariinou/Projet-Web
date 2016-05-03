class ChangeReferenceMatiere < ActiveRecord::Migration
  def self.up
  	change_table :matieres do |t|
  		t.references :user, index: true, foreign_key: true
  	end
  end

    def self.down
  	  remove_column :matieres, :enseignant_id
    end
end
