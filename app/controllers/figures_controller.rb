class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmark_ids << @landmark.id
    end
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.title_ids << @title.id
    end
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end


end
