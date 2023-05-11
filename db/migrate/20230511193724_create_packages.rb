class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :content
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
