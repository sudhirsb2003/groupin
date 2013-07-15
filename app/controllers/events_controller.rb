class EventsController < ApplicationController
  before_filter :authenticate_user!
  include ApplicationHelper

  # GET /events
  # GET /events.json
  def index
    @events = Event.order("name").page(params[:page]).per(5)
    @json = Event.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def event_attendence
   @event_id = Event.find(params[:event_id])
   @user_id = User.find(params[:user_id])
   @attendence = EventAttendence.create(:event_id => @event_id.id, :user_id => @user_id.id)
   #@event = Event.find(@event_id.id)
    if @attendence.save!
         @event_attendence = Event.find("#{@event_id.id}").update_attributes(:no_of_people => (@event_id.no_of_people)-1)
         #@total_attendence = Attendence.find("#{@meal.id}").meal.update_attributes(:no_of_guests_attending => (@meal.no_of_guests_attending)+1)
     redirect_to events_path , :notice => "Thank you for coming"
    end
  end
  
end
