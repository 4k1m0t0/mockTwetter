class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  #def new
  #  @tweet = Tweet.new
  #end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author = current_user.name
    @tweet.save
    redirect_to action: 'index'
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if current_user.name == @tweet.author
      @tweet.destroy
    end
    redirect_to action: 'index'
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :author, :image_id, :created_at)
  end
end
