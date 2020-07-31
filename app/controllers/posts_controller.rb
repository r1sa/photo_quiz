class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.date = Time.zone.today
    if answer_type? && @post.save!
      flash[:notice] = '投稿しました'
      redirect_to("/posts/#{@post.id}")
    else
      render('posts/new')
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    Post.transaction do
      @post.assign_attributes(post_params)
      if answer_type? && @post.save!
        flash[:notice] = '保存しました'
        redirect_to("/posts/#{@post.id}")
      else
        render('posts/edit')
      end
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/home/show')
  end

  def answer
    @post = Post.find_by(id: params[:id])
    @result = '答え'
    answer_choice if @post.answer_type == 'choice'
    render('posts/answer')
  end

  def correct_answer
    @post = Post.find_by(id: params[:id])
    @result = '正解！'
    answer_choice if @post.answer_type == 'choice'
    render('posts/answer')
  end

  def wrong_answer
    @post = Post.find_by(id: params[:id])
    @result = '残念！もう一度やってみよう！'
    @retry = true
    @answer_position = @post.answer_positions.first
    render('posts/show')
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :comment, :question, :answer_type,
                                 answer_choices_attributes: %i[id post_id answer is_correct_answer _destroy],
                                 answer_positions_attributes: %i[id post_id shape_type coords])
  end

  def answer_choice
    answers = AnswerChoice.where(post_id: params[:id], is_correct_answer: true).pluck(:answer)
    answers.each do |answer|
      @answer = @answer ? @answer + ', ' + answer : answer
    end
  end

  def answer_type?
    if @post.answer_type == 'choice'
      @post.answer_positions.destroy_all
      !@post.answer_choices.empty?
    elsif @post.answer_type == 'click_photo'
      @post.answer_choices.destroy_all
      !@post.answer_positions.empty?
    end
  end
end
