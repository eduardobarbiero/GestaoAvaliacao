class AddMinimaToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :minima, :integer
  end
end
