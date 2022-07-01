# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_626_070_803) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, default: -> { 'CURRENT_TIMESTAMP' }, null: false
    t.datetime 'updated_at', precision: 6, default: -> { 'CURRENT_TIMESTAMP' }, null: false
    t.index ['name'], name: 'index_categories_on_name', unique: true
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name: 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.text 'body'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'pets', force: :cascade do |t|
    t.string 'name'
    t.integer 'species'
    t.string 'breed'
    t.integer 'sex'
    t.boolean 'sterilized'
    t.date 'date_of_birth'
    t.string 'color'
    t.text 'additional_info'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'slug'
    t.integer 'status', default: 0, null: false
    t.string 'social_network_link'
    t.index ['slug'], name: 'index_pets_on_slug', unique: true
    t.index ['user_id'], name: 'index_pets_on_user_id'
  end

  create_table 'places', force: :cascade do |t|
    t.string 'name'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.integer 'status', default: 0, null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'category_id', null: false
    t.bigint 'pet_id', null: false
    t.bigint 'place_id'
    t.date 'date'
    t.index ['category_id'], name: 'index_posts_on_category_id'
    t.index ['pet_id'], name: 'index_posts_on_pet_id'
    t.index ['place_id'], name: 'index_posts_on_place_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'admin', default: false
    t.string 'name'
    t.string 'slug'
    t.boolean 'allow_email'
    t.string 'phone'
    t.string 'telegram'
    t.string 'viber'
    t.string 'facebook'
    t.string 'instagram'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['slug'], name: 'index_users_on_slug', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'messages', 'users'
  add_foreign_key 'pets', 'users'
  add_foreign_key 'posts', 'categories'
  add_foreign_key 'posts', 'pets'
  add_foreign_key 'posts', 'places'
  add_foreign_key 'posts', 'users'
end
