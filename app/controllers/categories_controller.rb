class CategoriesController < ApplicationController
  def show
    @stories = Story.where(category_id: params[:id]).order("created_at desc")
  end

  def edit
    
  end
end
