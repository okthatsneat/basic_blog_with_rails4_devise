class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy] 
  helper_method :article_belongs_to_user?


  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.sorted_descending
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    if !article_belongs_to_user?(@article)
      respond_to do |format|
      format.html { redirect_to :back, notice:'You cannot update articles that do not belong to you'}
      format.json { head :no_content }        
      end
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if article_belongs_to_user?(@article) && @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }     
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if article_belongs_to_user?(@article)      
      @article.destroy 
      respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice:'You cannot delete articles that do not belong to you'}
        format.json { head :no_content }
      end       
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def article_belongs_to_user?(article) 
      article.user == current_user
    end
end
