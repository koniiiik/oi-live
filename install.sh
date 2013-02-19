#!/bin/sh

# Copy all initcpio files to /usr/lib/initcpio.

FILES="
oi-live-misc
install/oi-live
install/oi-live-poweroff
hooks/oi-live
hooks/oi-live-poweroff
"

for file in $FILES; do
    cp -av "oi-live/$file" "/usr/lib/initcpio/$file"
done
