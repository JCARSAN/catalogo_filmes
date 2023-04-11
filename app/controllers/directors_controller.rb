class DirectorsController < ApplicationController
    def index
        @directors = Director.all
    end
    def new
        @director = Director.new
        @genres = Genre.all
        @select_content = []
        @genres.each{|genre| @select_content << [genre.name,genre.id]}
    end
    def show
        @director = Director.find(params[:id])
        @films = Film.where(:director_id => params[:id])
        @date_formatted = @director.born_date.strftime("%d/%m/%Y")
        @genre_name = Genre.find(@director.genre_id).name
    end
    def create
        @director = Director.new(
            name: params[:director][:name],
            photo: params[:director][:photo],
            nationality: params[:director][:nationality],
            born_date: params[:director][:born_date],
            genre_id: params[:director][:genre_id]
        )
        if @director.save
            return redirect_to director_path(@director.id)
        end
        flash[:notice] = 'Nenhum campo pode estar em branco!'
        render :new
    end
    def edit
        @director = Director.find(params[:id])
        @genres = Genre.all
        @select_content = []
        @genres.each{|genre| @select_content << [genre.name,genre.id]}
    end
    def update
        @director =  Director.find(params[:id])
        @director.update(
            name: params[:director][:name],
            photo: params[:director][:photo],
            nationality: params[:director][:nationality],
            born_date: params[:director][:born_date],
            genre_id: params[:director][:genre_id]
        )
        redirect_to directors_path
    end
end