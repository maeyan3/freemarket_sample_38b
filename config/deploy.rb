lock "~> 3.11.0"

set :application, "freemarket_sample_38b"
set :repo_url, "git@github.com:kazyam1001/freemarket_sample_38b"

set :deploy_to, '/var/www/freemarket_sample_38b'
set :scm, :git
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/kazyam/.ssh/mercari187.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
set :log_level, :debug

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
