require 'bundler/gem_tasks'

namespace :db do
  desc 'Import initial database schema'
  task :init do
    sh "echo 'create database pdns;' | psql -h localhost -U postgres"
    sh "psql -h localhost -U postgres pdns < powerdns.pgsql"
  end

  desc 'Drop database pdns on localhost'
  task :drop do
    sh "echo 'drop database pdns;' | psql -h localhost -U postgres"
  end
end
