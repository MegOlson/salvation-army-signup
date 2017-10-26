class DeleteDateTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :dates

    add_column(:volunteers, :date, :date)
  end
end
