class CommentList
    attr_reader :article
  
    def initialize(article_id)
      @article = Article.find(article_id)
    end
  
    def comments
      article.comments
    end
  end
  