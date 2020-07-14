class Api::ItemsController < ApplicationController
  def index
    @items = Item.all
    render 'index.json.jb'
  end

  def show
    @item = Item.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @item = Item.new(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    @item.save
    render 'show.json.jb'
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.update(
      name: params[:name] || @item.name,
      description: params[:description] || @item.description,
      price: params[:price] || @item.price,
    )
    @item.save
    render 'show.json.jb'
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    render json: {message: 'The item has been deleted.'}
  end
end
