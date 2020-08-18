#
# Cookbook:: bjc_windows_bootstrap
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Validator.pem on Workstation C:\opscode\chefdk\embedded\lib\ruby\gems\2.4.0\gems\berkshelf-6.3.1\spec\config
#
template 'c:\waiver.yml' do
    source '2012_waiver.yml.erb'
end

  powershell_script 'Create config.rb' do
    code <<-EOH
    $nodeName = "Win2012-detect-{0}" -f (-join ((65..90) + (97..122) | Get-Random -Count 4 | % {[char]$_}))
  
    $clientrb = @"
chef_server_url 'https://#{node['environment']['automate_url']}/organizations/#{node['environment']['chef_org']}'
validation_key 'C:\\Users\\Administrator\\AppData\\Local\\Temp\\kitchen\\cookbooks\\ap_demo\\recipes\\validator.pem'
node_name '{0}'
policy_group 'agency-1'
policy_name 'base_windows2012_detect'
ssl_verify_mode :verify_none
chef_license 'accept'
"@ -f $nodeName
  
    Set-Content -Path c:\\chef\\client.rb -Value $clientrb
    EOH
  end

  powershell_script 'Run Chef' do
    code <<-EOH
    ## Run Chef
    C:\\opscode\\chef\\bin\\chef-client.bat
    EOH
  end
