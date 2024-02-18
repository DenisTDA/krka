# frozen_string_literal: true

##
# Контроллер стартовой страницы
class StatisticsController < ApplicationController
  def index; end

  def create
    if params[:source_file].present?
      FileService::SourceFile.call(params[:source_file])
      flash[:success] = 'File was loaded successfuly'
    else
      flash[:alert] = 'Somthing wrong!!!'
    end

    render :index
  end
end
