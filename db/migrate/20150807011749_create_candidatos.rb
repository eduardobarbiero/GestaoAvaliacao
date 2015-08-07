class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
      t.string :nome
      t.string :email

      t.timestamps
    end
  end
end
