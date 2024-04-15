#!/bin/bash
set -e

# Remote machine details
remote_host="192.168.1.57"
remote_user="xfy"
remote_project_dir="/home/xfy/pl/Developer/show-client/build"
local_path="/Volumes/SN/Builds"

# Build the project remotely
build() {
	local build_param="${1:-build}" # Default to "build" if no argument provided

	ssh_command="ssh $remote_user@$remote_host 'cd $remote_project_dir && source ~/.zshrc && nvm use && yarn $build_param && tar zcvf build.tar.gz *'"
	eval "$ssh_command" || exit 1
}

# Clean local build artifacts
clean() {
	rm -rf "$local_path"/build.tar.gz || exit 1
	rm -rf "$local_path"/show-client || exit 1
	mkdir "$local_path"/show-client
}

# Download build artifacts from remote
scp_download() {
	scp "$remote_user@$remote_host:$remote_project_dir/build.tar.gz" "$local_path" || exit 1
	echo "Download done"
}

# Extract build artifacts
un_tar() {
	tar zxvf "$local_path"/build.tar.gz --directory="$local_path"/show-client || exit 1
	echo "Tar done"
}

# Main script execution
build "$1"
clean || exit 1
scp_download || exit 1
un_tar || exit 1

# Open relevant applications or directories
# open /Applications/Cyberduck.app || exit 1
# open "$local_path"/show-client/ || exit 1
