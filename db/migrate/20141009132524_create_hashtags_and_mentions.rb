class CreateHashtagsAndMentions < ActiveRecord::Migration
  def change
    create_table :hashtagtweets do |t|
      t.belongs_to :tweet
      t.belongs_to :hashtag
      t.timestamps
    end

    create_table :hashtags do |t|
      t.string :name
    end

    create_table :mentiontweets do |t|
      t.belongs_to :tweet
      t.belongs_to :mention
      t.timestamps
    end

    create_table :mentions do |t|
      t.string :name
    end
  end
end
