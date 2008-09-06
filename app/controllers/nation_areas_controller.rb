class NationAreasController < ApplicationController
  active_scaffold :nation_area do |config|
    config.columns = [:name, :description]
    config.nested.add_link "Players".t, [:players]
  end
end
