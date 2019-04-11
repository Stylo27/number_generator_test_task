class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :user_email
      t.integer :phone

      t.timestamps
    end
    add_index :phones, :user_email
    add_index :phones, :phone
  end
end
