class StaticController < ApplicationController

def index
  @posts = Post.find(:all, :limit => 5, :order => "units")
end

def show
  render :action => params[:page]
end

end

