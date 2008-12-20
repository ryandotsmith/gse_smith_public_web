require 'capistrano/recipes/deploy/strategy'

    
    # Set your project name here, it's probably best to use the domain name.
    set :application, "www.gsenterprises.com" 
    set :user, "rsmith"
    set :ssh_options, { :forward_agent => true }
    set :use_sudo,    false
    # Roles (You probably won't need to modify these.)
    role :app, "10.0.1.20"
    role :web, "10.0.1.20"
    role :db,  "10.0.1.20", :primary => true

    set :scm, :git
    set :repository, "git@10.0.1.20:www.gsenterprises.com.git"
    set :branch, "master"
    set :deploy_via, :remote_cache

    set :deploy_to, "/var/www/#{application}" 
