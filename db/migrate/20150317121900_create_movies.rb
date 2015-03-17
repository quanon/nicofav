class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :video_id, null: false, index: true
      t.string :title, null: false
      t.text :description

      t.string :thumbnail_url
      t.string :url

      t.datetime :first_retrieve
      t.string :length

      t.integer :view_count
      t.integer :comment_count
      t.integer :mylist_count

      t.integer :creator_id
      t.string :creator_nickname
      t.string :creator_icon_url

      t.timestamps null: false
    end
  end
end
