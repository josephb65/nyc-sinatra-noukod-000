class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    figure = params[:figure]
    title = params[:title]
    landmark = params[:landmark]

    @figure = Figure.create(figure)
    # @figure.landmark_ids =
    @figure.titles.find_or_create_by(name: title[:name])
    @figure.landmarks.find_or_create_by(name: landmark[:name])

    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find params[:id]
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find params[:id]
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = params[:figure]
    title = params[:title]
    landmark = params[:landmark]

    @figure = Figure.find params[:id]
    @figure.update figure
    # @figure.landmark_ids =
    @figure.titles.find_or_create_by(name: title[:name])
    @figure.landmarks.find_or_create_by(name: landmark[:name])

    redirect "/figures/#{@figure.id}"
  end
end