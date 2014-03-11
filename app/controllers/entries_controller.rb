class EntriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :tag, :tag_cloud]

  def index
    @entries = Entry.text_search(params[:query]).order('date desc').order('updated_at desc').page(params[:page]).per(300)
    @entry = Entry.new
    @entry.date = Date.today
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.author = current_user.name
    if @entry.save
      flash[:notice] = "Entry was successfully created" if @entry.save
      redirect_to entries_url
    else
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update_attributes(entry_params)
    if @entry.save
      redirect_to entries_url
    else
      render :edit
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.delete
    redirect_to entries_url
  end


  def tag
    @entries = Entry.tagged_with(params[:id]).order('date desc'). order('updated_at desc').page(params[:page]).per(200)
    @entry = Entry.new
    @entry.date = Date.today
    render :index
  end

  private
  def entry_params
    params.require(:entry).permit(:date, :note, :category_list => [])
  end
end
