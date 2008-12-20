require 'capistrano/recipes/deploy/strategy'

    
    # Set your project name here, it's probably best to use the domain name.
    set :application, "gse_smith_public_web" 
    #set :user, "rsmith"
    #set :ssh_options, { :forward_agent => true }
    #set :use_sudo,    false
    
    default_run_options[:pty] = true
    set :repository,  "git@github.com:ryandotsmith/gse_smith_public_web.git"
    set :scm, "git"
    set :scm_passphrase, "$m1thert0n" #This is your custom users password
    set :user, "rsmith"
    set :ssh_options, { :forward_agent => true }

    # Roles (You probably won't need to modify these.)
    role :app, "10.0.1.20"
    role :web, "10.0.1.20"
    role :db,  "10.0.1.20", :primary => true
    
    set :deploy_to, "/var/www/#{application}" 
    