class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    erb :new
  end

  post '/figures' do
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
