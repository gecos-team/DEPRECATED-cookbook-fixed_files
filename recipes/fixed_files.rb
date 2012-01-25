#
# Cookbook Name:: fixed_files
# Recipe:: fixed_files
#
# Copyright 2011 Junta de Andalucía
#
# Author::
#  * David Amian <damian@emergya.com>
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

fixed_files = node["fixed_files"]["fixed_files"].map{|x| x[1]}.flatten

fixed_files.each do |fixedfile|
  path_client = fixedfile["path_client"]
  file_url = fixedfile["file_url"]
  FileUtils.mkdir_p(path_client)
  remote_file path_client do
    source file_url
    owner fixedfile["user"]
    mode fixedfile["mode"]
  end  
end


