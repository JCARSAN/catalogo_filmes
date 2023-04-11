class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end
    def new
        @genre = Genre.new
    end
    def create
        @genre = Genre.new(name: params[:genre][:name])

        if @genre.save
            return redirect_to genre_path(@genre.id)
        end
        flash[:notice] = 'O campo gênero não pode estar em branco!'
        render :new
    end
    def show
        @genre = Genre.find(params[:id])
        @films = Film.where(:genre_id => params[:id], :status => "published")
    end
    def edit
        @genre = Genre.find(params[:id])
    end
    def update
       #puts "Params id: #{params[:id]}"
       @genre =  Genre.find(params[:id])
       @genre.update(name: params[:genre][:name])
       redirect_to genres_path
    end
end