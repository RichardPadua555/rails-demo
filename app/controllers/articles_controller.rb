class ArticlesController < ApplicationController
	before_action :set_article, only:[:show , :edit , :destroy , :update , :destroy]

	def show
		#shows the detailed view of a single entry
		
	end

	def index
		@articles = Article.all
		#shows the list of all availabe entries
	end

	def new
		@article = Article.new
		#Used for error purposes so that when the page reloads it has an instance variable it can display errors
		
	end

	def edit
	end


	def create
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			redirect_to @article
			flash[:notice] = "Article was created Succesfully!!"

		else

			render 'new'
		end	
		
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "Successfully updated the article"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		flash[:notice] = "Deleted Successfully"

		redirect_to articles_path
		
	end

	private


	def set_article
		@article = Article.find(params[:id])

    end

    def article_params
    	params.require(:article).permit(:title , :description)
    	
    end
end