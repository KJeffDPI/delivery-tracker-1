class AddDateToPackage < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :arrival_date, :date
  end
end
