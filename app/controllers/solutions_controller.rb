class SolutionsController < ApplicationController
  before_action :find_solution, only: [:update, :edit, :destroy, :show]
  before_action :search_solutions, only: [:index]

  # GET /solutions/new
  def new
    @solution = Solution.new
  end

  # POST /solutions
  def create
    @solution = Solution.create(solution_params)
    render path_to_case(@solution.case)
  end

  # PUT /solutions/:id
  def update
    if @solution.update(solution_params)
      redirect_to solutions_path
    else
      render :edit
    end
  end

  # GET /solutions
  def index
    @solution = Solution.new
    respond_to do |format|
      format.html
      format.xml { render xml: @solutions }
      format.json { render json: @solutions }
    end
  end

  # GET /solutions/:id/show
  def show
  end

  # GET /solutions/:id/edit
  def edit
  end

  # DELETE /solutions/:id
  def destroy
    @solution.destroy
    redirect_to solutions_path
  end

  private

  def find_solution
    @solution = Solution.friendly.find(params[:id])
  end

  def search_solutions
    @search = params[:search]
    if @search
      @solutions = Solution.where('LOWER(algorithm) LIKE LOWER(?)', "%#{@search}%")
    else
      @solutions = Solution.all
    end
  end

  def solution_params
    params.require(:solution).permit([:algorithm, :angle, :case_id, :description])
  end
end
