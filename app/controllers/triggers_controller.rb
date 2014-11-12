class TriggersController < ApplicationController

  def index

  end

  def destroy
    Trigger.find(params[:trigger_id]).destroy
    render nothing: true
  end

  def new
    @trigger = Trigger.new
  end

  def create
    @trigger = Trigger.new(trigger_params)
    @trigger.user_id = current_user.id
    @trigger.task = Task.find_by_method(params[:method])
    if @trigger.save
      render partial: "triggers/show.html", formats: :html
    else
      @error = "Looks like that trigger wasn't valid!"
      redirect_to new_trigger_path
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
    @trigger.duration_in_hours -= 1 unless @trigger.duration_in_hours < 1
    @trigger.save
    render nothing: true
  end


  private
  def trigger_params
    params.require(:trigger).permit(:message_text, :duration_in_hours)
  end

end
