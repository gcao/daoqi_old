set :application, "daoqi"
set :repository,  "git@heroku.com:daoqi.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

my_server = "209.20.88.80"

role :app, my_server
role :web, my_server
role :db,  my_server, :primary => true