class HomeController < ApplicationController
  def index
    @posts = Post.all.limit(10)
  end

  def show
    @posts = Post.all.limit(10)
  end
end
