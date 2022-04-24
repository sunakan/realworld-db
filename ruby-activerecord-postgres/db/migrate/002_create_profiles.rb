# frozen_string_literal: true

#
# CreateProfiles
# profilesテーブルを作成するためのMigrationクラス
#
class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.bigint :user_id, null: false
      t.text   :bio,     null: true
      t.text   :image,   null: true

      t.timestamps
    end
    add_foreign_key :profiles, :users, column: :user_id, primary_key: :id
  end
end
