class CreateDoctor < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact
      t.string :title
      t.string :degree

      t.timestamps
    end
  end
end
