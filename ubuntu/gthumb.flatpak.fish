#!/usr/bin/env fish

# gThumb because you can crop and then drag&drop on other apps
flatpak install --assumeyes org.gnome.gThumb

echo
echo "Setting gThumb as the default application by modifying ~/.config/mimeapps.list"
# Set as default application for all images
sd 'image/(.*)=([a-zA-Z.]*)' 'image/$1=org.gnome.gThumb.desktop' ~/.config/mimeapps.list
