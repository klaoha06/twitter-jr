class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_hash
      t.string :email
      t.string :city
      t.string :state
      t.string :gender

      t.timestamps
    end
  end
end
