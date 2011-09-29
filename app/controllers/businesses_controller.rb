class BusinessesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /businesses
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  def show
    @business = Business.find(params[:id])
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  def create
    @business = Business.new(params[:business])

    if @business.save
      redirect_to @business, notice: 'Business was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /businesses/1
  def update
    @business = Business.find(params[:id])

    if @business.update_attributes(params[:business])
      redirect_to @business, notice: 'Business was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /businesses/1
  def destroy
    @business = Business.find(params[:id])
    @business.destroy

    redirect_to root_url #businesses_url
  end
end
