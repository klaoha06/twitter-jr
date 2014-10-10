class TwitterTables < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :user
      t.belongs_to :follower, :class_name => "User"
    end

    create_table :tweets do |t|
      t.string :text
      t.belongs_to :user
      t.timestamps
    end

    create_table :replies do |t|
      t.string :text
      t.belongs_to :tweet
      t.belongs_to :user
      t.timestamps
    end

  end
end
