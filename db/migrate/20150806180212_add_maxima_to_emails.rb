class AddMaximaToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :maxima, :integer
  end
end
