set :application, "myfm"
set :deploy_to, "/opt/rails/#{application}"
set :deploy_via, :remote_cache

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:HE-Arc/MyFM.git"  # Your clone URL
set :branch, 'master'
set :scm, "git"
set :user, "appweb"  # The server's user for deploys
#set :scm_passphrase, "appweb"  # The deploy user's password
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "myfm.appweb.labinfo.eiaj.ch"                          # Your HTTP server, Apache/etc
role :app, "myfm.appweb.labinfo.eiaj.ch"                          # This may be the same as your `Web` server
role :db,  "myfm.appweb.labinfo.eiaj.ch", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end