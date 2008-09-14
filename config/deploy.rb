my_server = "209.20.88.80"
set :application, "daoqi"
set :repository,  "git@github.com:gcao/daoqi.git"
set :runner, "gcao"
set :deploy_to, "/home/gcao/deployment/#{application}"

set :scm, :git
set :deploy_via, :remote_cache

role :app, my_server
role :web, my_server
role :db,  my_server, :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end