module TournamentsHelper
  def start_date_form_column(record, start_date)
    calendar_date_select :record, :start_date, :time=>false
  end

  def end_date_form_column(record, end_date)
    calendar_date_select :record, :end_date, :time=>false
  end
end
