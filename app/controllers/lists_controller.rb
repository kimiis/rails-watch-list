class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @bookmark = Bookmark.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, photos: [])
    end

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end
end
