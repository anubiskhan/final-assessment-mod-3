class WelcomeController < ApplicationController
  def index

  end

  def new
    Validation.new(params[:q])
  end
end
