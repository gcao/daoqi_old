class TournamentsController < ApplicationController
  active_scaffold :tournament do |config|
    config.columns = [:name, :organizer, :description, :start_date, :end_date, :children]
    config.list.columns.exclude :children
    config.list.sorting = [:name=>:desc]
    config.nested.add_link "Sub Tournaments".t, [:children]
  end
  
  def tree(id = params[:node])
    respond_to do |format|
      format.html # render static index.html.erb
      format.json { render :json => Tournament.find_children(id)}
    end
  end
end
