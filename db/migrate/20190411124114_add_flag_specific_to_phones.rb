class AddFlagSpecificToPhones < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :specific, :boolean, null: false, default: false
    add_index :phones, :specific
  end
end
