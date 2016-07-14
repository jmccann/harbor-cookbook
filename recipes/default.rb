#
# Cookbook Name:: harbor
# Recipe:: default
#
# Copyright (c) 2016 Jacob McCann, All Rights Reserved.

package "linux-image-extra-#{node['kernel']['release']}"

docker_service 'default' do
  retries 1
  retry_delay 20
  storage_driver 'aufs'
  action [:create, :start]
end

remote_file '/usr/bin/docker-compose' do
  owner 'root'
  group 'root'
  mode '0755'
  source "https://github.com/docker/compose/releases/download/1.6.2/docker-compose-#{node['kernel']['name']}-#{node['kernel']['machine']}"
end

git '/opt/harbor' do
  repository 'https://github.com/vmware/harbor'
end

template '/opt/harbor/Deploy/harbor.cfg' do
  variables Hash[node['harbor']['config'].map { |k, v| [k.to_sym, v] }]
end

execute 'generate docker compose config' do
  cwd '/opt/harbor/Deploy'
  command './prepare'
  not_if 'docker inspect deploy_ui'
end

execute 'start stuff' do
  cwd '/opt/harbor/Deploy'
  command 'docker-compose up -d'
  not_if 'docker inspect deploy_ui'
end
