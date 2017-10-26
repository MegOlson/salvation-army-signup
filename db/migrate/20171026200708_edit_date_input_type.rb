class EditDateInputType < ActiveRecord::Migration[5.1]
  def change
    remove_column(:dates, :date, :string)
    add_column(:dates, :date, :date)
  end
end
