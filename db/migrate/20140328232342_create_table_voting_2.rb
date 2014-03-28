class CreateTableVoting2 < ActiveRecord::Migration
  def change
    create_table :votings do |t|
    	t.belongs_to :asnwer_group
    	t.string :username
    end
  end
end
