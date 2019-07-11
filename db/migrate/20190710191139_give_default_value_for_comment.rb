class GiveDefaultValueForComment < ActiveRecord::Migration[5.2]
  def change
    change_column :grades, :comment, :string, default: "no comment"
  end
end
