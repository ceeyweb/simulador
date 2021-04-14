module Admin
  class DownloadController < AdminController
    require 'csv'

    before_action :authenticate_admin!

    def new; end

    def create
      @mobility_report = MobilityReport.new(report_params)

      if @mobility_report.valid?
        render_csv
      else
        flash.now[:alert] = @mobility_report.error

        render :new
      end
    end

    private

    def report_params
      { start_date: params[:start_date], end_date: params[:end_date] }
    end

    def render_csv
      file_name = "movilidad.csv"

      headers["Content-Type"] = "text/csv"
      headers["Content-disposition"] = "attachment; filename=\"#{file_name}\""
      headers['X-Accel-Buffering'] = 'no'
      headers["Cache-Control"] ||= "no-cache"
      headers.delete("Content-Length")

      self.response_body = @mobility_report.csv
    end
  end
end
