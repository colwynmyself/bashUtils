#! /bin/sh

echo "Loading utility: LazyDev v1.33.7"

source ~/sh/config.sh

modules=(LazySSH)

lazydev () {
	let j=0
	echo "---------------------------------------------"
        echo "LazyDev v1.33.7 activated!"
	echo "Please choose one of the following modules to use"
	for i in "${modules[@]}"; do
                echo [$j] "$i"
                let j=$((j + 1));
        done
	echo "Type the corresponding number and hit [ENTER]"
        read choice
	if [[ -z $choice ]]
                then
                        echo "No module chosen, exiting LazyDev. Beep boop."
                        return
        fi
	${modules[choice]}
}
LazySSH(){
	let j=0
	echo "---------------------------------------------"
	echo "LazySSH activated!"
	echo "Please choose from the following connections:"
	for i in "${connections[@]}"; do
		echo [$j] "$i"
		let j=$((j + 1));
	done
	echo "Type the corresponding number and hit [ENTER]"
	read choice
	if [[ -z $choice ]] 
		then
			echo "No server chosen, exiting module."
			return
	fi
	echo "Would you like to connect with a certain username? Enter username or leave blank."
	read username
	if [[ $username ]]
		then
			echo "Connecting to ${servers[choice]} with username: $username"
			ssh "$username@${servers[choice]}"
		else
			echo "Connecting to ${servers[choice]} with username: ${usernames[choice]}"
			ssh "${usernames[choice]}@${servers[choice]}"
	fi
}
