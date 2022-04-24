# frozen_string_literal: true

#
# CreateFollowings
# followingsテーブルを作成するためのMigrationクラス
#
# ユーザーがユーザーをフォローをしていることを表現する
#
class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.bigint :following_id,  null: false
      t.bigint :follower_id,   null: false
      t.timestamp :created_at, null: false, precision: 6
    end
    add_foreign_key :followings, :users, column: :following_id, primary_key: :id
    add_foreign_key :followings, :users, column: :follower_id,  primary_key: :id

    add_index       :followings, %i[following_id follower_id], unique: true, name: :followings_index
  end
end
