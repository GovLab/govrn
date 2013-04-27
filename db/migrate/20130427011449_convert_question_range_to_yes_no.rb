class ConvertQuestionRangeToYesNo < ActiveRecord::Migration
  def up
    rename_column :responses, :vote, :vote_float
    add_column :responses, :vote, :string

    Response.reset_column_information

    Response.all.each do |resp|
      if resp.vote_float
        resp.vote = resp.vote_float > 0.5 ? 'yes' : 'no'
        resp.save!
      end
    end

    remove_column :responses, :vote_float
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
