class CreateEmailsConhecimentos < ActiveRecord::Migration
  def change
    create_table :emails_conhecimentos do |t|
      t.integer :email_id
      t.integer :conhecimento_id

      t.timestamps
    end
  end
end
