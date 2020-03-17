# @summary Install Apache NiFi Toolkit
#
# Install Apache NiFi Toolkit
#
# @param version
#   The version of Apache NiFi Toolkit. This must match the version in
#   the tarball.
#
# @param download_url
#   Where to download the binary installation tarball from.
#
# @param download_checksum
#   The expected checksum of the downloaded tarball. This is used for
#   verifying the integrity of the downloaded tarball.
#
# @param download_checksum_type
#   The checksum type of the downloaded tarball. This is used for
#   verifying the integrity of the downloaded tarball.
#
# @param install_root
#   The root directory of the nifi toolkit installation.
#
# @example Defaults
#   include nifi_toolkit
#
# @example Downloading from a different repository
#   class { 'nifi_toolkit':
#     download_url => 'https://repo.local/nifi/nifi-toolkit-1.10.0.tar.gz',
#   }
#
class nifi_toolkit (
  String $version = '1.11.3',
  String $download_url = 'http://mirrors.ibiblio.org/apache/nifi/1.11.3/nifi-toolkit-1.11.3-bin.tar.gz',
  String $download_checksum = '288179eeefe20c609644132c02fd989bd975eabe97ed14b52f0aa80a9d502757',
  String $download_checksum_type = 'sha256',
  Stdlib::Absolutepath $download_tmp_dir = '/var/tmp',
  Stdlib::Absolutepath $install_root = '/opt/nifi-toolkit',
) {

  $local_tarball = "${download_tmp_dir}/nifi-toolkit-${version}.tar.gz"
  $software_directory = "${install_root}/nifi-toolkit-${version}"
  $cli = "${software_directory}/bin/cli.sh"

  archive { $local_tarball:
    source        => $download_url,
    checksum      => $download_checksum,
    checksum_type => $download_checksum_type,
    extract       => true,
    extract_path  => $install_root,
    creates       => $software_directory,
    cleanup       => true,
  }

  file { $install_root:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { "${install_root}/current":
    ensure => link,
    target => $software_directory,
  }

  file { '/usr/local/bin/nifi-cli':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/nifi_toolkit/nifi-cli',
  }

  exec { "permissions for ${software_directory}":
    path        => ['/usr/bin'],
    command     => "chown -Rh root: ${software_directory}",
    refreshonly => true,
    subscribe   => Archive[$local_tarball],
  }
}
