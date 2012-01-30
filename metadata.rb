name              "fixed_files"
maintainer        "David Amian"
maintainer_email  "damian@emergya.com"
license           "Apache 2.0"
description       "Puts fiels in to clients in concrete path"
version           "0.1.1"

recipe            "fixed_files::create_files", "Copy remote files to the Chef node."
recipe            "fixed_files::remove_files", "Remove local files of the Chef node."

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute 'fixed_files/create_files',
  :display_name => "Create Files",
  :description  => "List of files",
  :type         => "array",
  :required     => "required",
  :recipes      => [ 'fixed_files::create_files' ]
  
attribute 'fixed_files/create_files/file_url',
  :display_name => "File Url",
  :description  => "Url that contains the file",
  :type         => "string",
  :required     => "required",
  :validation   => "url",
  :order        => "0",
  :recipes      => [ 'fixed_files::create_files' ]

attribute 'fixed_files/create_files/path_client',
  :display_name => "Path client",
  :description  => "Path to copy file in to the client",
  :type         => "string",
  :required     => "required",
  :validation   => "abspath",
  :order        => "1",
  :recipes      => [ 'fixed_files::create_files' ]

attribute 'fixed_files/create_files/user',
  :display_name => "Own",
  :description  => "File's owner username",
  :type         => "string",
  :required     => "required",
  :wizard       => "users",
  :order        => "2",
  :recipes      => [ 'fixed_files::create_files' ]

attribute 'fixed_files/create_files/group',
  :display_name => "Owner group",
  :description  => "File's owner group",
  :type         => "string",
  :required     => "required",
  :wizard       => "groups",
  :order        => "3",
  :recipes      => [ 'fixed_files::create_files' ]

attribute 'fixed_files/create_files/mode',
  :display_name => "Mode",
  :description  => "Mode of file (in e.g 0775)",
  :type         => "string",
  :required     => "required",
  :validation   => "modefile",
  :order        => "4",
  :recipes      => [ 'fixed_files::create_files' ]

attribute 'fixed_files/create_files/override',
  :display_name => "Override",
  :description  => "Create the file locally only if the file doesn't yet exist",
  :type         => "string",
  :required     => "required",
  :choice       => [ "true", "false" ],
  :order        => "5",
  :recipes      => [ 'fixed_files::create_files' ]

