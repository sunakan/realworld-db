# frozen_string_literal: true

#
# CreateArticleTags
# article_tagsテーブルを作成するためのMigrationクラス
#
# articlesとtagsを関連付ける中間テーブル
#
class CreateArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :article_tags do |t|
      t.bigint :article_id,    null: false
      t.bigint :tag_id,        null: false
      t.timestamp :created_at, null: false, precision: 6
    end
    add_foreign_key :article_tags, :articles, column: :article_id, primary_key: :id
    add_foreign_key :article_tags, :tags,     column: :tag_id,     primary_key: :id

    add_index       :article_tags, %i[article_id tag_id], unique: true, name: :article_tags_index
  end
end
