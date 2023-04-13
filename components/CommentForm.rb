class CommentForm
    attr_accessor :article_id, :author, :body
  
    def initialize(params)
      @article_id = params[:article_id]
      @author = params[:author]
      @body = params[:body]
    end
  
    def save
      article = Article.find(article_id)
      article.comments.create(author: author, body: body)
    end
  end
  