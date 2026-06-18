#!/bin/bash
# Script to set up GitHub SSH access

set -e  # Exit on any error

SSH_DIR="$HOME/.ssh"
KEY_FILE="$SSH_DIR/id_ed25519"
PUB_KEY_FILE="$KEY_FILE.pub"

echo "=== Setting up GitHub SSH access ==="

# 1. Ensure SSH directory exists
if [ ! -d "$SSH_DIR" ]; then
    echo "Creating SSH directory: $SSH_DIR"
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
fi

# 2. Check for existing SSH key, generate if missing
if [ ! -f "$KEY_FILE" ]; then
    echo "No existing SSH key found. Generating a new ed25519 key..."
    # Ask for email (optional, but we can use git config or prompt)
    GIT_EMAIL=$(git config --global user.email)
    if [ -z "$GIT_EMAIL" ]; then
        read -p "Enter your GitHub email: " GIT_EMAIL
    fi
    ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$KEY_FILE" -N ""
    echo "SSH key generated."
else
    echo "Existing SSH key found: $KEY_FILE"
fi

# 3. Start ssh-agent and add the key
echo "Starting SSH agent..."
eval "$(ssh-agent -s)" > /dev/null

echo "Adding SSH key to the agent..."
ssh-add "$KEY_FILE"

# 4. Display the public key and instructions
echo
echo "=== Your SSH public key ==="
cat "$PUB_KEY_FILE"
echo
echo "Copy the above key (including the comment) and add it to your GitHub account:"
echo "  GitHub.com → Settings → SSH and GPG keys → New SSH key"
echo
echo "After adding the key, you can test the connection with:"
echo "  ssh -T git@github.com"
echo

# 5. Optional: Test the connection (uncomment if you want to test automatically)
# echo "Testing connection to GitHub..."
# ssh -T git@github.com

echo "Setup complete. Remember to add the public key to GitHub as described above."