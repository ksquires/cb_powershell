describe package('powershell') do
  it { should be_installed }
end

describe repo ('/etc/yum.repos.d') do
  it { should exist }
end
