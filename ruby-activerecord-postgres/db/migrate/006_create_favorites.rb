# frozen_string_literal: true

#
# CreateFavorites
# favoritesテーブルを作成するためのMigrationクラス
#
# ユーザーが記事をお気に入りしたことを表現する
#
class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.bigint :user_id,       null: false
      t.bigint :article_id,    null: false
      t.timestamp :created_at, null: false, precision: 6
    end
    add_foreign_key :favorites, :users,    column: :user_id,    primary_key: :id
    add_foreign_key :favorites, :articles, column: :article_id, primary_key: :id

    add_index       :favorites, %i[user_id article_id], unique: true, name: :favorites_index
  end
end
