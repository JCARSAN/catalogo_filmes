class FilmsController < ApplicationController
    def index
        @films_published = Film.published
        @films_draft = Film.draft
    end
    def new
        @film = Film.new
        @genres = Genre.all
        @directors = Director.all
        @select_content_genre = []
        @genres.each{|genre| @select_content_genre << [genre.name,genre.id]}
        @select_content_director = []
        @directors.each{|director| @select_content_director << [director.name,director.id]}
    end
    def create
        status = 1
        if params[:status]
            status = 0
        end
        @film = Film.new(
            title: params[:film][:title],
            poster_photo: params[:film][:picture],
            released: params[:released],
            status: status,
            year_published: params[:film][:year_published],
            synopsis: params[:film][:synopsis],
            country: params[:film][:country],
            duration: params[:film][:duration],
            director_id: params[:film][:director_id],
            genre_id: params[:film][:genre_id]
        )
        if @film.save     
            return redirect_to film_path(@film.id)
        end
        flash[:notice] = 'Nenhum campo pode estar em branco!'

        render :new
    end
    def edit
        @film = Film.find(params[:id])
        @genres = Genre.all
        @directors = Director.all
        @select_content_genre = []
        @genres.each{|genre| @select_content_genre << [genre.name,genre.id]}
        @select_content_director = []
        @directors.each{|director| @select_content_director << [director.name,director.id]}
    end
    def show
        @film = Film.find(params[:id])
        @genre_name = Genre.find(@film.genre_id).name
        @director_name = Director.find(@film.director_id).name
    end
    def update
        status = 1
        if params[:status]
            status = 0
        end
        @film = Film.find(params[:id])
        @film.update(
            title: params[:film][:title],
            poster_photo: params[:film][:picture],
            released: params[:released],
            status: status,
            year_published: params[:film][:year_published],
            synopsis: params[:film][:synopsis],
            country: params[:film][:country],
            duration: params[:film][:duration],
            director_id: params[:film][:director_id],
            genre_id: params[:film][:genre_id]
        )
        redirect_to film_path(@film.id)
    end
end