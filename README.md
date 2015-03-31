Manages grub passwords. It sets the md5 for the el5 and el6 versions and the sha256 for el7.

The default password is in keepass. EL7 changed to using users, so that is included as well. By default it uses UV's settings, but they can be changed through params.

-Params
  md5_hash - el5 and el6 hash
  grub2_superusers - users with full access
  grub2_sha512_hash - el7 hash

