class SheriffController < ApplicationController
  DEFAULTHEAD = ":face_with_cowboy_hat:"
  HEADSPACE = "　             "
  BODY = "\n" + 
"　       :100::100::100:\n" +
"　    :100:   :100:   :100:\n" +
"　   :point_down:  :100::100:  :point_down:\n" +
"　       :100:      :100:\n" +
"　       :100:        :100:\n" +
"　       :boot:        :boot:\n"

  ALTBODY = "\n" + 
"　       :100::100::100:\n" +
"　    :100:   :100:   :100:\n" +
"　   :ok_hand:  :100::100:  :ok_hand:\n" +
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
    body = BODY

    if head[0] != ":" || head[-1] != ":")
      head = DEFAULTHEAD
      test.unshift(head)
    end

    if head == ":joy:"
      body = ALTBODY
    end

    subtext = ""
    if text.any?
      rest1 = text.join(" ")
      rest1.downcase!
      rest2 = rest1.clone
      rest2.gsub! /ing$/, ''
      rest2.gsub! /in'$/, ''
      rest2.gsub! /in$/, ''
      rest2.gsub! /ing /, ' '
      rest2.gsub! /in' /, ' '
      rest2.gsub! /in /, ' '
      
      subtext = "\nhowdy. im the sheriff of " + rest1 + ". im gon " + rest2
    end

    HEADSPACE + head + body + subtext 
  end
end
