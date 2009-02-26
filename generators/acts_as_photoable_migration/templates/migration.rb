class ActsAsPhotoableMigration < ActiveRecord::Migration
  def self.up
    create_table "photos" do |t|
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "photoable_id"
      t.string   "photoable_type"
    end
    
    add_index :photos, [:photoable_id, :photoable_type]
  end
  
  def self.down
    drop_table :photos
  end
end
