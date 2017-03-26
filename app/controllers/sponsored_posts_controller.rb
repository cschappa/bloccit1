class SponsoredPostsController < ApplicationController
  def show
    @post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = SponsoredPost.new
  end

  def create
    @post = SponsoredPost.new
    @post.title = params[:sponsored_post][:title]
    @post.body = params[:sponsored_post][:body]
    @post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])

    @post.topic = @topic

    if @post.save
      flash[:notice] = "Post was saved successfully"
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post"
      render :new
    end
  end

  def edit
    @post = SponsoredPost.find(params[:id])
  end

  def update
    @post = SponsoredPost.find(params[:id])
    @post.title = params[:sponsored_post][:title]
    @post.body = params[:sponsored_post][:body]
    @post.price = params[:sponsored_post][:price]

    if @post.save
      flash[:notice] = "Sponsored post was successfully updated"
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was a problem saving the sponsored post"
      render :edit
    end
  end

  def destroy
    @post = SponsoredPost.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was successfully deleted."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the sponsored post"
      render :show
    end
  end
end
