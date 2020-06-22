class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
    @answer_choices = @post.answer_choices.build
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @answer_choices = @post.answer_choices.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.date = Time.zone.today

    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to("/posts/#{@post.id}")
    else
      render('posts/new')
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = '保存しました'
      redirect_to("/posts/#{@post.id}")
    else
      render('posts/edit')
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = '削除しました'
    redirect_to('/home/show')
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :comment, :question, answer_choices_attributes: %i[id answer _destroy])
  end
end
