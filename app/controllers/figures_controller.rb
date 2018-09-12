class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @landmarks = Landmarks.all 
    @titles = Titles.all
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
    end
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
    end
    @figure = Figure.create(params)

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end


end
