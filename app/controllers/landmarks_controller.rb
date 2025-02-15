class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create params[:landmark]

    redirect "/landmark/#{@landmark.id}"
  end

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find params[:id]

    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find params[:id]

    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = params[:landmark]
    @landmark = Landmark.find params[:id]
    @landmark.update landmark
    # @landmark.landmark_ids =
    redirect "/landmarks/#{@landmark.id}"
  end
end