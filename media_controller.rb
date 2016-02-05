class MediaController < ApplicationController
  before_filter :get_playlist_from_playlist_id

  def index
    @media = medium.all
    respond_to do |format|
      format.xml { render xml: @songs }
    end
  end

  def show
    @medium = media.find(params[:id])
    respond_to do |format|
      format.xml { render xml: @medium }
    end
  end

  def new
    @medium = media.all
    respond_to do |format|
      format.xml { render xml: @medium }
    end
  end

  def create
    @medium = media.new(params[:medium])

    respond_to do |format|
      if @medium.save
        format.xml { render xml: @medium,
                            location: @medium }
      else
        format.xml { render xml: @medium.errors }
      end
    end
  end

  def update
    @medium = media.find(params[:id])

    respond_to do |format|
      if @medium.update_attributes(params[:song])
        fomart.xml { head :ok }
      else
        format.xml { render xml: @medium.errors }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.xml { head :ok }
    end
  end

  private

  def media
    @playlist
  end

  def get_playlist_from_playlist_id
    @playlist = Plalist.find_by_id(params[:playlist_id])
  end

end
