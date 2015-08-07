class CreateCandidatosEmails < ActiveRecord::Migration
  def change
    create_table :candidatos_emails do |t|
      t.integer :candidato_id
      t.integer :email_id

      t.timestamps
    end
  end
end
