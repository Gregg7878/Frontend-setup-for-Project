class ArticleDetail
    attr_reader :article
  
    def initialize(article_id)
      @article = Article.find(article_id)
    end
  end
  