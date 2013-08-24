class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
    @post = Post.new
    @user_groups = current_user.user_groups.all
    
  end

  def create
    case params[:type]
    when "activity"
        @activity = Activity.find(params[:activity])
        @post = @activity.posts.build(params[:post])
        @post.user = current_user
        @post.save
        #debugger
        unless params[:photo].nil?
          @post.photos << current_user.photos.build(params[:photo])
          @post.save
        end
        @activity.posts << @post
        @posts = @activity.posts.order("id DESC").all
        @post =Post.new
      respond_to do |format|
         format.html { redirect_to @activity, format: 'js' }
         format.js {  }
      end
    else
      
    if params[:user_groups].nil?
      flash[:error] = "Please select Group"
      @post = current_user.posts.build(params[:post])
      @user_groups = current_user.user_groups.all
      render 'posts/index'
    else
       
        @post = current_user.posts.build(params[:post])
          #if !params[:post][:photos_attributes].nil?
          #     Cloudinary::Uploader.upload(params[:post][:photos_attributes][:NEW_RECORD][:pic])
         # end
      
          @user_groups = current_user.user_groups.find(params[:user_groups].keys.collect(&:to_i))
          @post.save

          @user_groups.each do |user_group|
            @post.groups<< user_group.group
            end      
        if @post.save

         flash[:success] = "Post created!"
          redirect_to root_url
        else
          @user_groups = current_user.user_groups.all
          flash[:error] = "Post not created!"
          #redirect_to root_url
          render 'posts/index'
        end
    end
    end
  end

  def destroy
    @id = @post.id 
    @post.destroy
    respond_to do |format|
         format.html { redirect_to @activity, format: 'js' }
         format.js { }
    end
  end

  private

    def correct_user
      @post = current_user.posts.find(params[:id])
    rescue
      redirect_to root_url
    end



end