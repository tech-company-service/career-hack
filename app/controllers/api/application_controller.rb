class Api::ApplicationController < ApplicationController
  def options
    if params[:options].nil?
      []
    else
      params[:options].map(&:to_sym)
    end
  end
end