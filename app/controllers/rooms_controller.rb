class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :count, :find, :front_person, :who]

  protect_from_forgery except: [:front, :who]
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @users = @room.users
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET
  def count
    count = @room.count
    personal = {'count' => count }
    render :json => personal
  end

  # POST
  def find
    @room.front_person = params["user_id"]
    respond_to do |format|
      if @room.save
        format.json { head :ok }
        format.html { head :ok }
      else
        format.json { render json: @room.errors, status: :unprocessable_entity }
        format.html { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET
  def front_person
    if @room.front_person == nil or @room.front_person == 0 then
      render :json => {}
    else  
      user = User.find(@room.front_person)
      json = {'user_id' => @room.front_person , 'name' => user.name }
      render :json => json
    end
  end

  def who
    array = []
    @room.users.each do |user|
      if user.in_or_out then
        array.push user
      end
    end
    render :json => array
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name)
    end
end
