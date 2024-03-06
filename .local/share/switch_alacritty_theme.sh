#!/bin/bash

# Directory where the Alacritty theme files are located
THEME_DIR="$HOME/.config/alacritty/themes"

# Main Alacritty config file path
MAIN_CONFIG="$HOME/.config/alacritty/alacritty.toml"

# List and select a theme
echo "Available themes:"
themes=("$THEME_DIR"/*.toml)
for i in "${!themes[@]}"; do
  theme_file="${themes[$i]##*/}"
  theme_name=$(echo "$theme_file" | sed -e 's/\(.*\)\.toml/\1/' -e 's/_/ /g' -e 's/-/ /g' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1')
  printf "%d) %s\n" "$((i + 1))" "$theme_name"
done

echo "Select a theme by number:"
read -r choice

# Validate input and update config
if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#themes[@]}" ]; then
  selected_theme="${themes[$choice-1]}"
  selected_theme_filename="${selected_theme##*/}"
  
  # Prepare the new import line
  new_import_line="import = [\"$THEME_DIR/$selected_theme_filename\"]"
  
  # Check if there's already an import line
  if grep -q "^import =" "$MAIN_CONFIG"; then
    # Replace the existing import line
    sed -i "/^import =/c$new_import_line" "$MAIN_CONFIG"
  else
    # Insert the new import line at the beginning of the file
    echo -e "$new_import_line\n$(cat "$MAIN_CONFIG")" > "$MAIN_CONFIG"
  fi
  
  echo "Switched to theme: $(echo "$selected_theme_filename" | sed 's/\(.*\)\.toml/\1/' | tr '_' ' ' | tr '-' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1')"
else
  echo "Invalid selection."
fi
