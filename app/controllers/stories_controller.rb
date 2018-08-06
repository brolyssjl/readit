class StoriesController < ApplicationController
  def index
    # @story = Story.find_by(name: 'SitePoint Forums')
    @story = Story.order('RANDOM()').first
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.save
    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:name, :link)
  end
end
