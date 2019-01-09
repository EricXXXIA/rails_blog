class ArticlesController < ApplicationController
    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      # @article.save
      # redirect_to_article_path(@article)
      if @article.save
        flash[:notice] = "Article was successfully created"
        redirect_to_article_path(@article)
      else
        render 'new'
      end
    end

    def show
      @article = Article.find(params[:id])
    end

    private
      def article_params
        params.require(:article).permit(:title, :descrition)
      end
end
