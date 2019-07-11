class GiveDefaultValueForValue < ActiveRecord::Migration[5.2]
  def change
    change_column :grades, :value, :integer, default: 0
  end
end
