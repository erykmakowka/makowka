#!/bin/bash

#zmienna globalne
#ładowanie danych z pliku
user_list=(`cat users.txt`)

function showUsers() {
    echo "loadUsers ..."
    echo "Lista:"
    for(( i=0; i<=${#user_list[@]}; i++ ))
    do
	echo "	 ${user_list[i]}"
    done
}

function addUsers () {
    echo "addUsers ..."
    echo -n "Are you sure?  [y/n] "
    read sure
    if [ "${sure}" == "y" ]; then
    for user in "${user_list[@] } "
    do
	echo "Add user:  ${user}"
	sudo useradd ${user} -s /sbin/nologin -g "users"
	done
    fi
}


function delUsers () {
    echo "delUsers ..."
    echo -n "Are you sure?  [y/n]"
    read sure
    if [ ${sure} == "y" ]; then
	for user in "${user_list[@] }"
	do
	    echo "Remove user ${user} [OK] "
	    sudo userdel ${user}
	done
    fi
}


function acceptRemoteLogin () {
    echo "acceptRemoteLogin ..."
}


function deniedRemoteLogin () {
    echo "deniedRemoteLogin ..."
}
function quit () {
    exit 0
}
function help() {
cat << EndOfMessage
    Opis opcji skryptu:
    ------------------
    SU -> Listowanie użytkowników z pliku
    AU -> Dodawanie użytkowników
EndOfMessage
}

#menu
select option in SU AU DU ARL DRL HELP QUIT
do
    case ${option} in
	"SU") showUsers ;;
	"AU") addUsers ;;
	"DU") delUsers ;;
	"ARL") acceptRemoteLogin ;;
	"DRL") deniedRemoteLogin ;;
	"HELP") help ;;
	"QUIT") quit ;;
	     *) help;;
    esac
done

