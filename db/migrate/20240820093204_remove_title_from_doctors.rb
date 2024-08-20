class RemoveTitleFromDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :title, :string
  end
end
