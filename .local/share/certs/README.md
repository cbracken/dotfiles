Create a symlink named `ca-certficates.crt` to the operating system CA
certificates file. This allows us to configure programs to use the same
home-directory-relative path on all operating systems.

The CA certificates file can be found at the following locations:
* FreeBSD     /usr/local/share/certs/ca-root-nss.crt
* Arch Linux  /etc/ssl/certs/ca-certificates.crt
