class ArticlesController < ApplicationController
    def index
        @articles=Article.all
        render json: {articles: @articles}
    end
    def create
        article=Article.new
        @name=params['name']
        @des=params['description']
        article.name=@name
        article.description=@des      
        article.save
        render json:{'message':"data inserted"}
    end
   
    def destroy
        id=params['id']
        article=Article.find_by(id:id)
        article.destroy
        render json:{'message':"data deleted!"}
    end
    def update
        id=params['id']
        name=params['name']
        des=params['description']
        art=Article.find_by(id:id)
        art.update(name:name)
        art.update(description:des)
        render json:{"mesage":"data update complete"}
    end
end
