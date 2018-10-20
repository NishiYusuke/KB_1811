class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :in_or_out]
  before_action :set_room, only: [:new]

  protect_from_forgery except: :in_or_out
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @histories = @user.histories
  end

  # GET /users/new
  def new
    #@user = User.new
    @user = @room.users.build
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def in_or_out
    #@history = History.new(history_params)
    @history = @user.histories.build
    #@history.user_id = @user.id
    @history.in_or_out = params["in_or_out"]
    #@history.in_or_out = true

    respond_to do |format|
      if @history.save
        format.json { head :ok }
      else
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :room_id, :attachment)
    end
end
