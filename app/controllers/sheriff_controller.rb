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
      rest1 = text.join(" ")
      rest1.downcase!
      rest2 = rest1
      rest2.gsub! 'ing ', ' '
      rest2.gsub! "in\' ", ' '
      rest2.gsub! 'in ', ' '
      
      subtext = "\nhowdy. im the sheriff of " + rest1 + ". im gon " + rest2
    end

    HEADSPACE + head + BODY + subtext 
  end
end
