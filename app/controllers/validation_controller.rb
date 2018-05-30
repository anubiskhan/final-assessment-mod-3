class ValidationController < ApplicationController
  def new
    @validation = Validation.new
  end

  def show
    @validation = Validation
  end
end
