#
# Cookbook:: cb_powershell
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute 'gpg-key' do
  command 'rpm --import https://packages.microsoft.com/keys/microsoft.asc'
  not_if 'rpm -qi gpg-pubkey-be1229cf-*'
end

yum_repository 'microsoft' do
  baseurl 'https://packages.microsoft.com/rhel/$releasever/prod/'
  gpgcheck true
  enabled true
  description 'packages-microsoft-com-prod'
end

package 'powershell' do
  action :upgrade
end
