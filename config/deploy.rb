lock '3.10.1'

set :application, 'guelph'
set :repo_url, 'https://github.com/manjeet-bhatkar/guelph.git' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/home/deploy/guelph'
set :pty, true
# set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, '2.3.1' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

after "deploy", "deploy:seed"

def rake( cmd )
  run "cd #{symlink_path}; GEM_PATH=#{gems_path} RAILS_ENV=#{rails_env} #{rake_path} #{cmd}"
end

namespace :deploy do  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :seed, roles => :app, :except => { :no_release => true } do
    # rake "db:migrate"
    rake "db:seed"
  end
   
  task :start do end
	task :stop do end
end
