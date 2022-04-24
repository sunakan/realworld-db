# frozen_string_literal: true

require 'active_record'
require 'yaml'
require 'erb'

#
# 1. 環境の決定(ENVでいじれる)
# 2. Railsとかでよくあるconfig/database.ymlと同じようなやつを作ってる
#   - dbへの接続情報周りを記述
# 3. ActiveRecordでコネクションを張る設定
# 4. Migrationの準備としてファイルの場所を指定して、migrateコマンド
#

# 1.
ENVIRONMENT = ENV.fetch('ENV') { 'development' }

# 2.
erb_result = ERB.new(File.read(File.expand_path('../config/database.yaml.erb', __dir__))).result

#
# YAML.loadの挙動が変わったので注意
#
# Ruby 3.1 Release note
# https://www.ruby-lang.org/ja/news/2021/12/25/ruby-3-1-0-released/
# YAML.loadがPSych4系を使うようになった
#   => デフォルトの挙動がPsync.loadがPsync.safe_loadを利用する
#   => YAMLのエイリアス(&や*)がデフォではOUT
#   => Dateはオブジェクトにデフォでは変換されない
# 参考: [Ruby 3.1で非互換になるYAML.load](https://www.docswell.com/s/pink_bangbi/K67RV5-2022-01-06-201330)
dbconfig = YAML.load(erb_result, aliases: true)

# 3.
ActiveRecord::Base.establish_connection(dbconfig[ENVIRONMENT])

# 4.
ActiveRecord::MigrationContext.new(File.expand_path('../db/migrate', __dir__), ActiveRecord::SchemaMigration).migrate

puts '-------------------------------'
puts "現在のバージョンは#{ActiveRecord::Migration.current_version}"
puts '-------------------------------'
