#!/usr/bin/awk -f

################################################################################
# Install outdated Python packages via pip for a Gentoo system.
# Input must be in requirements format.
################################################################################

BEGIN {
    FS = "="
}
$1 !~ /pip/ && $1 !~ /portage/ {
    num_installed++
    install = "pip install -U --user"
    print $1 | install
    close(install)
}
END {
    if (!num_installed)
        print "Nothing to do."
}
