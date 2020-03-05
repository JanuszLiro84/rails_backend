class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :update, :destroy]

  # GET /deals
  def index
    DealsService.call
    @deals = Deal.group_by_stage

    render json: @deals
  end

end
