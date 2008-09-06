class PlayersController < ApplicationController
  active_scaffold :player do |config|
    config.columns = [:nation_area, :last_name, :first_name, :chinese_name, :rank, :is_amateur,
      :sex, :birth_year, :province_state, :city, :website, :email, :description]
    config.list.columns = [:nation_area, :last_name, :first_name, :chinese_name, :rank, :description]
    config.list.sorting = [:last_name, :first_name]
    config.columns[:nation_area].form_ui = :select
  end
end
