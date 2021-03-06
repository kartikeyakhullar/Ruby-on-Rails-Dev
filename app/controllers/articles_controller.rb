class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
        # @article = Article.find(params[:id]);
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        # @article = Article.find(params[:id]);
    end

    def create
        byebug
        @article = Article.new(article_params);
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article was successfully saved!!"
            redirect_to article_path(@article)
        else
            render 'new'
        end 
    end

    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully!!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        if @article.destroy
            flash[:notice] = "Article successfullly destroyed!!"
            redirect_to articles_path
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "You can only edit or delete your own article"
            redirect_to @article
        end
    end



end
