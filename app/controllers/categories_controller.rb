# show and edit categories
class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories/1
  # GET /categories/1.json
  def show
    @entries = Entry.tagged_with(params[:id]).text_search(params[:query])
                    .order('date desc'). order('created_at desc')
                    .page(params[:page])
                    .per(200)
  end

  # GET /categories/new
  def new; end

  # GET /categories/1/edit
  def edit; end

  # POST /categories
  # POST /categories.json
  def create
    @tag = ActsAsTaggableOn::Tag.new(category_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
      else
        format.html { redirect_to 'new' }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  def tag
    @entries = Entry.tagged_with(params[:id])
                    .order('date desc')
                    .order('updated_at desc')
                    .page(params[:page])
                    .per(200)
    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = ActsAsTaggableOn::Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params[:category]
  end
end
