class CreateCategoryArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :category_articles do |t|
      t.integer :article_id
      t.integer :category_id
      t.timestamps
    end
  end
end
