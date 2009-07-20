class UsersController < ApplicationController

before_filter :login_required, :only=>['welcome']

  def welcome
    @user = session[:user]
    @posts = Post.find(:all, :limit => 5, :conditions => ["user_id = ?", session[:user][:id]], :order => "created_at")
  end

  def login
  end

  def signup
    @user = User.new(params[:user])
    if request.post?
      if @user.save
        session[:user] = User.authenticate(params[:user][:email], params[:user][:password])
	flash[:message] = "Signup successful"
	redirect_to :action => "welcome"
      else
        flash[:message] = "Signup unsuccessful"
	redirect_to :action => "signup"
      end
    end
  end

  def loginverify
    if request.post?
      if session[:user] = User.authenticate(params[:user][:email], params[:user][:password])
        flash[:message] = "Login successful"
	# change it to redirect_to_stored later
        redirect_to :action => "welcome"
      else
	flash[:message] = "Login failed. Please try again."
	redirect_to :action => "login"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:message] = "Logout successful"
    redirect_to :action => "login"
  end

  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
