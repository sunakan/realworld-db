# frozen_string_literal: true

#
# CreateTags
# tagsテーブルを作成するためのMigrationクラス
#
class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
