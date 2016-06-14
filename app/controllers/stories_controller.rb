class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]
  before_action :find_story, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @stories = Story.all.order("created_at desc").page(params[:page]).per(5)
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to @story
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @story
    else
      render "edit"
    end

  end

  def destroy
    @story.destroy
    redirect_to root_path
  end

  def upvote
    @story.upvote_by(current_user)
    redirect_to :back
  end

  def downvote
    @story.downvote_by(current_user)
    redirect_to :back
  end

  private
    def story_params
      params.require(:story).permit(:body, :title, :category_id)
    end

    def find_story
      @story = Story.find(params[:id])
    end
end
