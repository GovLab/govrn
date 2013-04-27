class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :role
      t.string :udid
      t.string :zip
      t.string :email

      t.timestamps
    end

    add_column :questions, :user_id, :integer
    add_column :responses, :user_id, :integer
  end
end
