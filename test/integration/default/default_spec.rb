describe command('docker ps') do
  its('stdout') { should include 'deploy_ui' }
  its('stdout') { should include 'deploy_mysql' }
  its('stdout') { should include 'deploy_jobservice' }
  its('stdout') { should include 'deploy_registry' }
  its('stdout') { should include 'deploy_proxy' }
  its('stdout') { should include 'deploy_log' }
end

describe command('curl -f http://localhost') do
  its('exit_status') { should eq 0 }
end
