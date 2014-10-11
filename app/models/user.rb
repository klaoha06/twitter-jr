require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password_hash, presence: true
    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end
  has_many :tweets
  has_many :relationships
  has_many :followers, :through => :relationships
  has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => "follower_id"
  has_many :inverse_followers, :through => :inverse_relationships, :source => :user

  def follow_self
    Relationship.create!(:user_id => self.id, :follower_id => self.id)
  end

  after_create do
    follow_self
  end
end
