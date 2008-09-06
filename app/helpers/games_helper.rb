module GamesHelper
  def type_form_column(record, type)
    s = "<select id='record_type' name='record[type]'>"
    {0=>'Weiqi', 1=>'Daoqi'}.each_pair do |key, value|
      s += "<option"
      s += " selected" if record["type"].to_i == key
      s += ">#{value}</option>"
    end
    s + "</select>"
  end
  
  def played_at_form_column(record, played_at)
    calendar_date_select :record, :played_at, :time=>false
  end
end
