name              "fixed_files"
maintainer        "David Amian"
maintainer_email  "damian@emergya.com"
license           "Apache 2.0"
description       "Puts fiels in to clients in concrete path"
version           "0.1.1"

recipe            "fixed_files::fixed_files", "Puts fiels in to clients in concrete path"

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute 'fixed_files/fixed_files',
  :display_name => "Fixed Files",
  :description  => "List of fixed files",
  :type         => "array",
  :required     => "required",
  :recipes      => [ 'fixed_files::fixed_files' ]
  
attribute 'fixed_files/fixed_files/file_url',
  :display_name => "File Url",
  :description  => "Url that contains the fixed file",
  :type         => "string",
  :required     => "required",
  :validation   => "url",
  :order        => "0",
  :recipes      => [ 'fixed_files::fixed_files' ]

attribute 'fixed_files/fixed_files/path_client',
  :display_name => "Path client",
  :description  => "Path to set fixed file in to the client",
  :type         => "string",
  :required     => "required",
  :validation   => "abspath",
  :order        => "1",
  :recipes      => [ 'fixed_files::fixed_files' ]

