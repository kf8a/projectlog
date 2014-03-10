class TagsController < ApplicationController
  respond_to :json

  def index
    @tags = ActsAsTaggableOn::Tag.named_like(params[:search] || '').joins(:taggings).where(:taggings => { :context => params[:context] || '' }).distinct

    logger.info(@tags)
    respond_with(@tags) do |format|
      format.json { render :json => @tags.to_json(
        :only => [:id, :name])
      }
    end
  end

end
