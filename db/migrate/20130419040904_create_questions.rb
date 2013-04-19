class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :abstract
      t.text :description

      t.timestamps
    end
  end
end
