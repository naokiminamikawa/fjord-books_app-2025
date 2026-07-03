# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user

    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy

    redirect_to reports_path, notice: 'reportを削除しました。'
  end

  def edit
    @report = Report.find(params[:id])
  end
  
  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to @report, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :body)
  end
end
