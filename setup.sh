#!/usr/bin/env bash

CONFIG_SOURCE="$HOME/setup/config"

# List of configurations and their destinations
declare -A CONFIG_TARGETS=(
  ["alacritty.toml"]="$HOME/.config/alacritty/alacritty.toml"
  ["config.kdl"]="$HOME/.config/zellij/config.kdl"
  ["config.fish"]="$HOME/.config/fish/config.fish"
)

echo "Creating config folders and symlinks..."
for CONFIG_FILE in "${!CONFIG_TARGETS[@]}"; do
  TARGET_PATH="${CONFIG_TARGETS[$CONFIG_FILE]}"
  TARGET_DIR=$(dirname "$TARGET_PATH")

  # Create target directory if it doesn't exist
  mkdir -p "$TARGET_DIR"

  # Remove existing files/directories if they exist
  if [[ -e "$TARGET_PATH" || -L "$TARGET_PATH" ]]; then
    echo "Removing existing file/link: $TARGET_PATH"
    rm -rf "$TARGET_PATH"
  fi

  # Create the symbolic link
  ln -s "$CONFIG_SOURCE/$CONFIG_FILE" "$TARGET_PATH"
  echo "Linked $CONFIG_SOURCE/$CONFIG_FILE → $TARGET_PATH"
done
echo "Config symlinking complete!"

BIN_SOURCE="$HOME/setup/bin/"
BIN_TARGET="$HOME/bin"
ln -sf "$BIN_SOURCE" "$BIN_TARGET"
echo "Symlink created: $BIN_TARGET -> $BIN_SOURCE"
