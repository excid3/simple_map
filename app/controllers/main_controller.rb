class MainController < ApplicationController
  def index
    @markers = Business.all.to_gmaps4rails
    @businesses = Business.all
  end
end
