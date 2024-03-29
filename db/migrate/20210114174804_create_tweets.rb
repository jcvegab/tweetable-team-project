class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :tweets_count, default: 0
      t.integer :likes_count, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :tweets }
      t.timestamps
    end
  end
end
