class AlgorithmsController < ApplicationController
  before_action :find_algorithm, only: [:update, :edit, :destroy, :show]
  before_action :search_algorithms, only: [:index]

  # GET /algorithms/new
  def new
    @algorithm = Algorithm.new
  end

  # POST /algorithms
  def create
    @algorithm = Algorithm.new(algorithm_params)
    if @algorithm.save
      redirect_to algorithms_path
    else
      render :new
    end
  end

  # PUT /algorithms/:id
  def update
    if @algorithm.update(algorithm_params)
      redirect_to algorithms_path
    else
      render :edit
    end
  end

  # GET /algorithms
  def index
    respond_to do |format|
      format.html
      format.xml { render xml: @algorithms }
      format.json { render json: @algorithms }
    end
  end

  # GET /algorithms/:id/show
  def show
  end

  # GET /algorithms/:id/edit
  def edit
  end

  # DELETE /algorithms/:id
  def destroy
    @algorithm.destroy
    redirect_to algorithms_path
  end

  private

  def find_algorithm
    @algorithm = Algorithm.find(params[:id])
  end

  def search_algorithms
    @search = params[:search]
    if @search
      @algorithms = Algorithm.where('LOWER(name) LIKE LOWER(?)', "%#{@search}%")
    else
      @algorithms = Algorithm.all
    end
  end

  def algorithm_params
  end
end