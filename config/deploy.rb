require 'bundler/capistrano'

default_run_options[:pty] = true  # Must be set for the password prompt from git to work

# name of the application
set :application, "MyFM"
set :deploy_to, "/opt/rails/#{application}"

set :user, "appweb"

set :scm, :git
set :repository, "http://github.com/HE-Arc/MyFM.git"
set :branch, 'master'

role :web, "myfm.appweb.labinfo.eiaj.ch"                          # Your HTTP server, Apache/etc
role :app, "myfm.appweb.labinfo.eiaj.ch"                          # This may be the same as your `Web` server
role :db,  "myfm.appweb.labinfo.eiaj.ch", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# Passenger mod_rails 
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end