class ChangeIntegerLimitInPhones < ActiveRecord::Migration[5.2]
  def change
    change_column :phones, :phone, :integer, limit: 8
  end
end
