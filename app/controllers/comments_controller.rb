class CommentsController < ApplicationController
  # storyをセット
  before_action :set_story
  # commentをセット
  before_action :set_comment, except: [:create]
  def create
    @comment = @story.comments.create(comment_params)
    redirect_to @story
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end

    def set_comment
      @comment = @story.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:phrase)
    end

end
