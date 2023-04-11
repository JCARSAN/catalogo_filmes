class HomeController < ApplicationController
    def index
        @films = Film.published
        @genres = Genre.all
        @directors = Director.all
    end
end