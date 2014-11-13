class TriggersController < ApplicationController

  def index

  end

  def destroy
    Trigger.find(params[:trigger_id]).destroy
    render nothing: true
  end

  def update
    puts trigger_params
    puts trigger_params
    @trigger = Trigger.find(params[:id])
    @trigger.message_text = trigger_params[:message_text]
    @trigger.save
    render partial: 'show.html'
  end

  def new
    @trigger = Trigger.new
  end

  def edit
    @trigger = Trigger.find(params[:id])
    render partial: 'edit.html'
  end

  def create
    @trigger = Trigger.new(trigger_params)
    @trigger.user_id = current_user.id
    @trigger.task = Task.find_by_method(params[:method])
    if @trigger.save
      render partial: "triggers/show.html", formats: :html
    else
      @error = "Looks like that trigger wasn't valid!"
      render partial: 'errors.html'
    end
  end

  def increase_durations
    @trigger = Trigger.find(params[:trigger_id])
    @trigger.duration_in_hours += 1
    @trigger.save
    render nothing: true
  end

  def decrease_durations
    @trigger = Trigger.find(params[:trigger_id])
    @trigger.duration_in_hours -= 1 unless @trigger.duration_in_hours < 2
    @trigger.save
    render nothing: true
  end


  private
  def trigger_params
    params.require(:trigger).permit(:id, :message_text, :duration_in_hours)
  end

end
