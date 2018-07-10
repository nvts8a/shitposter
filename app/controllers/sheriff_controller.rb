class SheriffController < ApplicationController
  HEADSPACE = "　             "
  BODY = "\n" + 
"　       :100::100::100:\n" +
"　    :100:   :100:   :100:\n" +
"　   :point_down:  :100::100:  :point_down:\n" +
"　       :100:      :100:\n" +
"　       :100:        :100:\n" +
"　       :boot:        :boot:\n"

  def index
    render json: {}
  end

  def create
    render json: {
      text: make_response(params[:text]), 
      response_type: "in_channel"
    }
  end


  def make_response(unsplit)
    text = unsplit.split(' ')
    head = text.shift
    subtext = ""
    if text.any?
      rest = text.join(" ")
      subtext = "\nhowdy. im the sheriff of " + rest + ". im gon " + rest
    end

    HEADSPACE + head + BODY + subtext 
  end
end
