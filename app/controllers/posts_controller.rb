class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id

    respond_to do |format|
      if @post.save
        flash[:notice] = "投稿を作成しました"
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:notice] = "投稿を編集しました"
        format.html { redirect_to @post }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :image, :category, :rate_deli, :rate_acc, :rate_rep, :rate_cost)
    end
end
