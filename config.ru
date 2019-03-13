require './config/environment'
require 'pry'

#this allows us to use HTTP methods like puts/patch
use Rack::MethodOverride
use UserController
use EateryController

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


# Mount the main controller as our Rack Application, again only one RUN file 
run AppController

