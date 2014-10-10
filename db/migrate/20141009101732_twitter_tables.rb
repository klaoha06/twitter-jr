class TwitterTables < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :user
      t.belongs_to :follower, :class_name => "User"
    end

    create_table :tweets do |t|
      t.string :text
      t.belongs_to :user
      t.references :original
      t.timestamps
    end

    create_table :conversations do |t|
      t.belongs_to :tweet
      t.belongs_to :reply, :class_name => "Tweet"
    end

    create_table :retweetconversations do |t|
      t.belongs_to :tweet
      t.belongs_to :retweet, :class_name => "Tweet"
    end
  end
end
