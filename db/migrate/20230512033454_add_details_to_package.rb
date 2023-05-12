class AddDetailsToPackage < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :details, :string
  end
end
