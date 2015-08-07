class CreateConhecimentos < ActiveRecord::Migration
  def change
    create_table :conhecimentos do |t|
      t.string :nome
      t.integer :minima
      t.integer :maxima

      t.timestamps
    end
  end
end
