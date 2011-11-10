class BusinessesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :tagged, :show]

  # GET /businesses
  def index
    @businesses = Business.order(:name)
  end

  def tagged
    @tag = params[:tag]
    @businesses = Business.tagged_with(@tag)
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
    @business = current_user.businesses.find(params[:id])
  end

  # POST /businesses
  def create
    @business = current_user.businesses.build(params[:business])

    if @business.save
      redirect_to @business, notice: 'Business was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /businesses/1
  def update
    @business = current_user.businesses.find(params[:id])

    if @business.update_attributes(params[:business])
      redirect_to @business, notice: 'Business was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /businesses/1
  def destroy
    @business = current_user.businesses.find(params[:id])
    @business.destroy

    redirect_to root_url #businesses_url
  end
end
