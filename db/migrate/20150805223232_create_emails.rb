class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :titulo
      t.string :corpo

      t.timestamps
    end
  end
end
