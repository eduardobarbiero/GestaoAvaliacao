class AddGenericoToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :generico, :string
  end
end
