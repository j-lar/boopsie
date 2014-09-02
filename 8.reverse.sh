#!/bin/bash
blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "${blue}Please enter the path to the file you'd like to reverse:${normal}\n"
read path
tac $path
