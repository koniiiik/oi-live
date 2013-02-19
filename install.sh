#!/bin/sh

# Copy all initcpio files to /usr/lib/initcpio.

FILES="
oi-live-misc
shutdown-oi-live
install/oi-live
install/oi-live-poweroff
hooks/oi-live
hooks/oi-live-poweroff
"
C_PROGRAMS="
ntfs-3g-initrd-wrapper
"

for file in $FILES; do
    cp -av "oi-live/$file" "/usr/lib/initcpio/$file"
done

for file in $C_PROGRAMS; do
    gcc -Os -o "/usr/lib/initcpio/${file}" "oi-live/${file}.c"
    strip "/usr/lib/initcpio/${file}"
done
