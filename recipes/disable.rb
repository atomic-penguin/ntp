#
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
# Cookbook Name:: ntp
# Recipe:: disable
#

service node['ntp']['service'] do
  action [ :disable, :stop ]
end

case node['platform']
when "ubuntu","debian"
  template "/etc/default/ntpdate" do
    source "default.ntpdate.erb"
    owner node['ntp']['conf_owner']
    group node['ntp']['conf_group']
    mode "0644"
    variables(
      :disable => TRUE,
    )
  end
end
