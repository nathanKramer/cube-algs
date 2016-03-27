class CasesController < ApplicationController
  before_action :filter_cases, only: [:index]
  before_action :find_case, only: [:show, :edit, :update]

  # GET /cases
  def index
    respond_to do |format|
      format.html
      format.xml { render xml: @cases }
      format.json { render json: @cases }
    end
  end


  def f2l
    filter_cases(Case.f2l)
  end

  def oll
    filter_cases(Case.oll)
  end

  def pll
    filter_cases(Case.pll)
  end

  # PATCH / PUT
  # /cases/:id
  def update
    if @case.update(case_params)
      redirect_to cases_path
    else
      render :edit
    end
  end

  # GET /cases/:id/show
  def show
    @algorithm = Algorithm.new
  end

  # GET /cases/:id/edit
  def edit
  end

  def find_case()
    @case = Case.find(params[:id])
    if params[:reflection]
      @case.reflection = Case.find(params[:reflection])
    end
  end

  def filter_cases(scope=Case)
    @filter = params[:filter]
    if @filter
      filter = "%#{@filter}%"
      @cases = scope.where(
        '(nickname LIKE ?)',
        filter
      )
    else
      @cases = scope.all
    end
  end

  def case_params
    params.require(:case).permit([:nickname, :reflection, :order_of_rotational_symmetry, :is_involutory])
  end
end