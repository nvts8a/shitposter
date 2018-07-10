class SheriffController < ApplicationController
  BODY = 
".             :babby:\n" +
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
    render text: BODY 
  end
end
