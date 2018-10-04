class StoriesController < ApplicationController
  before_action :ensure_login, only: [:new, :create]

  def index
    # @story = Story.order(Arel.sql('RANDOM()')).first
    # Using counter cache
    # fetch_stories 'votes_count >= 5' protected method
    # Using scopes
    @stories = Story.popular
  end

  def new
    @story = Story.new
  end

  def create
    # @story = Story.new(story_params)
    @story = @current_user.stories.build story_params
    if @story.save
      flash[:notice] = 'Story submission succeeded'
      redirect_to stories_path
    else
      render action:'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def bin
    # fetch_stories 'votes_count < 5' Protected method
    # Using scopes
    @stories = Story.upcoming
    render action: 'index'
  end

  # protected
  # def fetch_stories(conditions)
  #   @stories = Story.where(conditions).order('id DESC')
  # end

  private
  def story_params
    params.require(:story).permit(:name, :link, :description)
  end
end
