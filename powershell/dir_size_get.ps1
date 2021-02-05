# This script will cycle through all directories in the current dir and product a size for it

gci -force 'C:\Users'-ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {
    $len = 0
    gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | % { $len += $_.length }
    $_.fullname, '{0:N2} GB' -f ($len / 1Gb)
    }