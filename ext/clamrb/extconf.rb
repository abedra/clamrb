require 'mkmf'
$CFLAGS = "--std=c99 -Wall"
have_library("clamav")
create_makefile('clamrb/clamrb')
