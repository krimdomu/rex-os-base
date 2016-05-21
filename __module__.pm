#
# AUTHOR: jan gehring <jan.gehring@gmail.com>
# REQUIRES:
# LICENSE: Apache License 2.0
#
# Simple Module to install Apache on your Server.

package Rex::OS::Base;

use Rex -base;

our %package_map = (
  debian => [ "netcat", "htop", "tree", "unzip", "strace", "ltrace", "vim" ],
  ubuntu => [ "netcat", "htop", "tree", "unzip", "strace", "ltrace", "vim" ],
  centos =>
    [ "nc", "htop", "tree", "unzip", "strace", "ltrace", "vim-enhanced" ],
  redhat =>
    [ "nc", "htop", "tree", "unzip", "strace", "ltrace", "vim-enhanced" ],
);

task setup => make {
  my $packages = param_lookup "packages",
    $package_map{ lc get_operating_system };

  pkg $packages, ensure => "latest";
};

1;
