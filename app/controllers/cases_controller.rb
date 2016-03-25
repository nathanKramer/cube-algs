class CasesController < ApplicationController
  before_action :filter_cases, only: [:index]

  # GET /cases
  def index
    respond_to do |format|
      format.html
      format.xml { render xml: @cases }
      format.json { render json: @cases }
    end
  end

  def filter_cases
    @filter = params[:filter]
    if @filter
      filter = "%#{@filter}%"
      @cases = Case.where(
        '(case_type LIKE ?) or (nickname LIKE ?)',
        filter,
        filter
      )
    else
      @cases = Case.all
    end
  end
end