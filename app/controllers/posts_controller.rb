class PostsController < ApplicationController

  before_action :find_group
	
  def new

  	#@group = Group.find(params[:group_id])
    @post = @group.posts.new

  end

  def edit
  	#@group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])
  end

  def create
  	#@group = Group.find(params[:group_id])
    @post = @group.posts.new(post_params)

    if @post.save
      redirect_to group_path(@group), :notice => 'Post OK!'
    else
      render :new
    end
  end

  def update
  	#@group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group), :notice => 'Post Update OK!'
    else
      render :edit
    end
  end

  def destroy
  	#@group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), :alert => 'Post!Deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_group
      @group = Group.find(params[:group_id])
  end

end