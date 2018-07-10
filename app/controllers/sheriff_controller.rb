class SheriffController < ApplicationController
  HEADSPACE = ".             "
  BODY = "\n" + 
".       :100::100::100:\n" +
".    :100:   :100:   :100:\n" +
".    :point_down: :100::100: :point_down:\n" +
".        :100:    :100:\n" +
".        :100:      :100:\n" +
".        :boot:      :boot:\n"

  def index
    render json: {}
  end

  def create
    render json: {
      text: HEADSPACE + params[:text] + BODY,
      response_type: "in_channel"
    }
  end
end
