class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :category_articles
    has_many :articles, through: :category_articles
end