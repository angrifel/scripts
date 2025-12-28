#!/usr/bin/env bash

check_dependencies() {
	command -v find 2>/dev/null 1>&2 || {
		printf "find not found. aborting\n"
		return 1
	}
	
	command -v git 2>/dev/null 1>&2 || {
		printf "git not found. aborting\n"
		return 1
	}

	return 0
}

set_user_config() {
	local username="angrifel"
	local email="angrifel@users.noreply.github.com"
	git config --global user.name "${username}" 
	git config --global user.email "${email}"
}

set_commit_signing_key() {
	pub_key_file="$1"
	git config --global gpg.format ssh
	git config --global user.signingkey "${pub_key_file}"
	git config --global commit.gpgsign true
}

list_pub_keys() {
	find "$HOME/.ssh" -name "*.pub"
}

configure_signing_key() {
	printf "signing key file: "
	read signing_key_file
	if [ -f "${signing_key_file}" ]
	then
		set_commit_signing_key "${signing_key_file}"
	else
		printf "signing key does not exist\n"
		return 1
	fi
	
}

display_main_menu() {
	cat << MAIN_MENU
Workstation configurtion
  
Options

  1) configure github username and email
  2) configure commit for key signing
  3) list keys

  0) exit

MAIN_MENU
}

main() {
	local choose_on=1
	while [ "${choose_on}" = "1" ]
	do
		display_main_menu
		printf "Choose an option: "
		read user_option
		
		case "${user_option}" in
			1)
				set_user_config
				;;
			2)
				configure_signing_key
				;;
			3)
				list_pub_keys
				;;
			0)	
				choose_on=""
				;;
			*)
				printf "invalid option\n"
				;;
		
		esac
	done

	return 0
	
}

check_dependencies || {
	exit 1
}
main

