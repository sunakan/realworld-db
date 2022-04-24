# frozen_string_literal: true

#
# CreateUsers
# usersテーブルを作成するためのMigrationクラス
#
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,    null: false
      t.text   :username, null: false
      t.text   :password, null: false

      t.index :email,    unique: true
      t.index :username, unique: true

      t.timestamps
    end
  end
end
