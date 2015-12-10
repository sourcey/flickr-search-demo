class PhotosController < ApplicationController
  def index
    if params[:search]
      if params[:search].empty?
        flash.now[:error] = 'Please enter a search term'
      else
        @photos = Flickr.photos.search(text: params[:search], page: params[:page] || 1, per_page: 20)
      end
    end
  end
end
