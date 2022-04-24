class CreateArticleComments < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comments do |t|
      t.bigint    :author_id,  null: false
      t.bigint    :article_id, null: false
      t.text      :body,       null: false
      t.timestamps
    end
    add_foreign_key :article_comments, :users, column: :author_id,  primary_key: :id
    add_foreign_key :article_comments, :users, column: :article_id, primary_key: :id
  end
end
