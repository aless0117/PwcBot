class EventToUsersController < ApplicationController
  before_action :set_event_to_user, only: [:show, :edit, :update, :destroy]

  # GET /event_to_users
  # GET /event_to_users.json
  def index
    @event_to_users = EventToUser.all
  end

  # GET /event_to_users/1
  # GET /event_to_users/1.json
  def show
  end

  # GET /event_to_users/new
  def new
    @event_to_user = EventToUser.new
  end

  # GET /event_to_users/1/edit
  def edit
  end

  # POST /event_to_users
  # POST /event_to_users.json
  def create
    @event_to_user = EventToUser.new(event_to_user_params)

    respond_to do |format|
      if @event_to_user.save
        format.html { redirect_to @event_to_user, notice: 'Event to user was successfully created.' }
        format.json { render :show, status: :created, location: @event_to_user }
      else
        format.html { render :new }
        format.json { render json: @event_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_to_users/1
  # PATCH/PUT /event_to_users/1.json
  def update
    respond_to do |format|
      if @event_to_user.update(event_to_user_params)
        format.html { redirect_to @event_to_user, notice: 'Event to user was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_to_user }
      else
        format.html { render :edit }
        format.json { render json: @event_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_to_users/1
  # DELETE /event_to_users/1.json
  def destroy
    @event_to_user.destroy
    respond_to do |format|
      format.html { redirect_to event_to_users_url, notice: 'Event to user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_to_user
      @event_to_user = EventToUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_to_user_params
      params.require(:event_to_user).permit(:event_id, :user_id)
    end
end
