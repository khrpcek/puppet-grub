class grub (
  $md5_hash = $grub::params::md5_hash,
  $grub2_superusers = $grub::params::grub2_superusers,
  $grub2_sha512_hash = $grub::params::grub2_sha512_hash,
) inherits grub::params

{
  include grub::config

}
