class MainController < ApplicationController
  def index
    @businesses = Business.all
  end
end
