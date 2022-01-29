class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: %i[index show category_search tag_search word_search]

  def index
    @post_all = Post.all
    # ソート機能（新しい順、古い順）
    @posts = if params[:sort_create]
               Post.all.page(params[:page]).per(10)
             else
               Post.all.page(params[:page]).per(10).reverse_order
             end
    @categorys = Category.all
  end

  def category_search
    @post_all = Post.all
    @categorys = Category.all
    # 受け取ったカテゴリーIDと同じカテゴリーをリストから探し取得
    @category_searched = Category.find(params[:id])
    # カテゴリーが上のcategory_searchと一致する投稿を全て取得
    @all_posts_searched = Post.where(category_id: @category_searched.id)
    # 取得した投稿の最新10件を表示
    @posts = if params[:sort_create]
               @all_posts_searched.page(params[:page]).per(10)
             else
               @all_posts_searched.page(params[:page]).per(10).reverse_order
             end
  end

  def tag_search
    @post_all = Post.all
    @tag_list = Tag.all
    # 検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    # クリックされたタグに紐づく投稿を表示
    @posts = @tag.posts.page(params[:page]).per(10).reverse_order
    @categorys = Category.all
  end

  def word_search
    @post_all = Post.all
    @categorys = Category.all
    # 検索された文字を受け取る
    @keywords = params[:keyword]
    @posts = Post.includes(:customer, :post_comments).page(params[:page]).per(10).reverse_order
    split_keywords = @keywords.split(/[[:blank:]]+/)
    split_keywords.each do |word|
      @posts = @posts.eager_load([:category, { tag_maps: :tag }]).where([
                                                                          'posts.title LIKE ? OR posts.body LIKE ? OR categories.name LIKE ? OR tags.name LIKE ?',
                                                                          "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%"
                                                                        ])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to public_post_path(@post.id)
      flash[:success] = '投稿しました'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
    # ログインユーザーと検索した投稿が紐づいていなければマイページに遷移させる
    redirect_to public_customer_path(current_customer) unless @post.customer == current_customer
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to public_post_path(@post.id)
      flash[:success] = '投稿内容を変更しました'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_customer_path(@post.customer)
    flash[:danger] = '投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category_id)
  end
end
