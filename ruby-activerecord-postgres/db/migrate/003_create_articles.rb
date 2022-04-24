# frozen_string_literal: true

#
# CreateArticles
# articlesテーブルを作成するためのMigrationクラス
#
class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.bigint  :author_id,       null: false
      t.string  :title,           null: false
      t.string  :slug,            null: false
      t.text    :body,            null: false
      t.string  :description,     null: false
      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id, primary_key: :id
    add_index       :articles, :slug, unique: true
  end
end
