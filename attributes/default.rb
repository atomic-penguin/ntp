#
# Cookbook Name:: ntp
# Attributes:: default
#
# Author:: Joshua Timberman (<joshua@opscode.com>)
#
# Copyright 2009-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# default attributes for all platforms
default['ntp']['is_server'] = false
default['ntp']['servers']   = ["0.pool.ntp.org", "1.pool.ntp.org"]
default['ntp']['driftfile'] = "/var/lib/ntp/ntp.drift"
default['ntp']['statsdir'] = "/var/log/ntpstats/"
default['ntp']['conf_owner'] = "root"
default['ntp']['conf_group'] = "root"
default['ntp']['var_owner'] = "ntp"
default['ntp']['var_group'] = "ntp"
default['ntp']['packages'] = %w{ ntp ntpdate }
default['ntp']['service'] = "ntp"

# overrides on a platform-by-platform basis
case platform
when "redhat","centos","fedora","scientific","amazon","oracle"
  default['ntp']['service'] = "ntpd"
  default['ntp']['packages'] = %w{ ntp }
  case node['platform_version'].to_i
  when 6
    default['ntp']['packages'] = %w{ ntp ntpdate } 
  end
when "freebsd"
  default['ntp']['service'] = "ntpd"
  default['ntp']['driftfile'] = "/var/db/ntpd.drift"
  default['ntp']['statsdir'] = "/var/db/ntpstats/"
  default['ntp']['packages'] = %w{ ntp }
  default['ntp']['var_owner'] = "root"
  default['ntp']['var_group'] = "group" 
end

default['ntp']['peers'] = []
default['ntp']['restrictions'] = []
