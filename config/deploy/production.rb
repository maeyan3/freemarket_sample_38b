server '13.230.105.155', user: 'kazdeploy', roles: %w{app db web}
set :rails_env, "production"
set :unicorn_rack_env, "production"
