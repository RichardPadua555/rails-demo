class ArticlesController < ApplicationController

	def show
		@article = Article.find(params[:id])
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
		@article = Article.find(params[:id])
	end


	def create
		@article = Article.new(params.require(:article).permit(:title , :description))
		if @article.save
			redirect_to @article
			flash[:notice] = "Article was created Succesfully!!"

		else

			render 'new'
		end	
		
	end

	def update
		@articles = Articles.find(params[:id])
		if @articles.update(params.require(:article).permit(:title , :description)
			flash[:notice] = "Article was updates Successfully"
		else
			render 'edit'
		end	
	end
end