require 'capistrano/recipes/deploy/strategy'
    # Capistrano PHP Deployment Recipe
    # Created by Pat Nakajima

    # TODO  Create a setup task that would create apache conf file for the project.
    
    ################
    #
    # Please create the dir on the server before deploy
    #
    # Then run cap deploy:php
    #
    ################
    
    # Set your project name here, it's probably best to use the domain name.
    set :application, "www.smith-transportation.com" 
    set :user, "rsmith"

    # Roles (You probably won't need to modify these.)
    role :app, "10.0.1.18"
    role :web, "10.0.1.18"
    role :db,  "10.0.1.18", :primary => true

    # Set the location of your PHP project in your repository.
    set :repository,  "svn://10.0.1.18/var/repository/smith-transportation.com" 

    # Deployment Settings
    # Set the location that you'd like as your project's destination.
    # I created a separate folder from my Rails apps to put things like this.
    set :deploy_to, "/var/www/#{application}" 
    set :deploy_via, :checkout

    namespace :deploy do
      namespace :php do

        # Strips much of Capistrano's default deployment process because
        # it's tailored for Rails apps, and we don't need most of it.
        desc "Deploy a PHP project." 
        task :default do
          update_code
          symlink
        end

        task :update_code, :except => { :no_release => true } do
          on_rollback { run "rm -rf #{release_path}; true" }
          strategy.deploy!
          finalize_update
        end

        # This part is borrowed from Geoffrey Grosenbach.
        # Overridden since PHP doesn't have some of the Rails directories
        task :finalize_update, :except => { :no_release => true } do
          # Make directories writeable by the deployment user's group
          run "chmod -R g+w #{release_path}" if fetch(:group_writable, true)
        end

        # Symlinks 
        task :symlink, :except => { :no_release => true } do
          on_rollback { run "rm -f #{current_path}; ln -s #{previous_release} #{current_path}; true" }
          run "rm -f #{current_path} && ln -s #{release_path} #{current_path}" 
        end

        task :restart, :roles => :app do
          # Do nothing (I have a different recipe to restart Apache.)
        end

      end
    end
