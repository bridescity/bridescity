class MainController < ApplicationController

  def index
    @posts = Post.find(:all)
  end

end
