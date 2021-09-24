class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    articles = Article.all
    if articles.any?
      render json: {articles: articles}
    else 
      render json: { message: 'There are no articles' }
    end
  end

  def create
    article = Article.create(title: params[:article][:title], 
                            author: params[:article][:author],
                            lede: params[:article][:lede])
                            
    render json: { message: 'Your article was created' }, status: 201
  end

  private

  # def authenticate_user!
  #   binding.pry
  #   super
  # end
  

end

