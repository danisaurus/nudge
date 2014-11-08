class TriggersController < ApplicationController

  def index

  end



  def new
    @trigger = Trigger.new
  end

  def create
    @trigger = Trigger.new(trigger_params)
    if @trigger.save
      render "new"
    else
      render "new"
    end
  end

  private

  def trigger_params
    params.require(:trigger).permit(:message_text, :duration_in_hours)
  end

end
