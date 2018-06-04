class ValidationsController < ApplicationController

  def show
    @validation = Validation.new(params[:q])
  end
end
