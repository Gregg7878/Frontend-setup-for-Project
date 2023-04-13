class ArticleForm
    include ActiveModel::Model
    attr_accessor :title, :body
  
    validates :title, presence: true
    validates :body, presence: true
  
    def save
      article = Article.create(title: title, body: body)
      if article.valid?
        article
      else
        errors.merge!(article.errors)
        false
      end
    end
  end
  