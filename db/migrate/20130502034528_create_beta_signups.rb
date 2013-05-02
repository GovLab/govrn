class CreateBetaSignups < ActiveRecord::Migration
  def change
    create_table :beta_signups do |t|
      t.text :email

      t.timestamps
    end
  end
end
