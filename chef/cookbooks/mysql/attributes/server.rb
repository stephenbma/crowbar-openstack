#
# Cookbook Name:: mysql
# Attributes:: server
#
# Copyright 2008-2009, Opscode, Inc.
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

default["mysql"]["bind_address"]              = node["ipaddress"]
default["mysql"]["tmpdir"]                    = "/var/lib/mysqltmp"
default["mysql"]["datadir"]                   = "/var/lib/mysql"

if attribute?("ec2")
  default["mysql"]["ec2_path"]                = "/mnt/mysql"
  default["mysql"]["ebs_vol_dev"]             = "/dev/sdi"
  default["mysql"]["ebs_vol_size"]            = 50
end

default["mysql"]["tunable"]["max_allowed_packet"]       = "16M"
default["mysql"]["tunable"]["max_connections"]          = "800"
default["mysql"]["tunable"]["max_heap_table_size"]      = "32M"
default["mysql"]["tunable"]["thread_cache_size"]        = 8

# InnoDB Settings
default["mysql"]["tunable"]["innodb_buffer_pool_size"]  = "256M"
default["mysql"]["tunable"]["innodb_log_file_size"]     = "128M"


# Ports to bind to when haproxy is used
default[:mysql][:ha][:ports][:admin_port] = 3306
