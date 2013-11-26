#
# Cookbook Name:: orc-mysql
# Recipe:: default
#
# Copyright (C) 2013 Jerry W Jackson
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "database::mysql"

# create an initial datanase
node{:db}.each do |env, name|
  execute "create database #{name}" do
    command "mysql -uroot -e 'create database if not exists #{name};'"
    user "vagrant"
  end
end
