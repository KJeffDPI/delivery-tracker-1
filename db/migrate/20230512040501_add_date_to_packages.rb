class AddDateToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :date, :date
  end
end
