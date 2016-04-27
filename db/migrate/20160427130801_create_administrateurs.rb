class CreateAdministrateurs < ActiveRecord::Migration
  def change
    create_table :administrateurs do |t|

      t.timestamps null: false
    end
  end
end
