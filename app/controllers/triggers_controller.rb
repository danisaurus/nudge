class TriggersController < ApplicationController

  def index

  end

  def new
    @trigger = Trigger.new
  end

  def create
    @trigger = Trigger.new(trigger_params)
    if @trigger.save
      render partial: "triggers/show.html", formats: :html
    else
      @error = "Looks like that trigger wasn't valid!"
      redirect_to new_trigger_path
    end
  end

  private
  def trigger_params
    params.require(:trigger).permit(:message_text, :duration_in_hours)
  end

end
