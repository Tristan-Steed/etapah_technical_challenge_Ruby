class PackagesController < ApplicationController
  before_action :set_package, only: %i[show edit update destroy]

  # GET /packages or /packages.json
  def index
    @packages = Package.all
    render json: @packages
  end

  # GET /packages/1 or /packages/1.json
  def show
    render json: @package
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages or /packages.json
  def create
    @package = Package.new(package_params)

    if @package.save
      render json: @package, status: :created, location: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packages/1 or /packages/1.json
  def update
    if @package.update(package_params)
      render json: @package, status: :ok, location: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1 or /packages/1.json
  def destroy
    @package.destroy
    head :no_content
  end

  private

  def set_package
    @package = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:reference_number, :location, :destination, :date, :timeslot, :user_id)
  end
end
