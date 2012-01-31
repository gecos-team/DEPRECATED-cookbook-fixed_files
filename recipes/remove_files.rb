#
# Cookbook Name:: fixed_files
# Recipe:: remove_files
#
# Copyright 2011 Junta de Andalucía
#
# Author::
#  * Antonio Hernández <ahernandez@emergya.com>
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

def remove_files()

  files = node["fixed_files"]["remove_files"].map{|x| x[1]}.flatten

  files.each do |file|

    file_path = file['file_path']

    begin

      if File.exists?(file_path)
        if File.file?(file_path)
          file file_path do
            backup false
            action :delete
          end
        elsif File.directory?(file_path)
          directory file_path do
            recursive true
            action :delete
          end
        end
      end

    rescue Exception => e
      puts "Error processing fixed_files:remove_files:#{file_path}: " + e
    end
  end
end

begin
  remove_files
rescue Exception => e
  puts e
end
