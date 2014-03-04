class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  	  t.belongs_to :twitter_user
  	  t.text :content

  	  t.timestamps
  	end
  end
end
