#!/bin/bash
blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "${blue}Going to run apt-get in case we need to install flex and byacc.\nGet ready to enter sudo password}\nPress Enter when ready.${normal}"
read

#install prereqs for building if necessary
sudo apt-get install flex byacc -y

#download, extract, configure and make latest version of libpcap
printf  "${blue}Ready to download and install latest version of libpcap. Press enter when ready${normal}"
read
wget http://www.tcpdump.org/release/libpcap-1.6.1.tar.gz
tar -xvzf libpcap-1.6.1.tar.gz

#change to libpcap make directory
pushd libpcap-1.6.1
sh ~/libpcap-1.6.1/configure
make
popd

#download, extract latest version of tcpdump
printf  "${blue}Ready to download and install latest version of tcpdump. Press enter when ready.${normal}"
read
wget http://www.tcpdump.org/release/tcpdump-4.6.1.tar.gz
tar -xvzf ~/tcpdump-4.6.1.tar.gz

#change to tcpdump make directory
pushd ~/tcpdump-4.6.1
sh ~/tcpdump-4.6.1/configure
make
popd


printf "\n\n${blue}Ready to run tests. Press Enter to continue.${normal}\n\n"
read

#change to test directory and run tests
pushd ~/tcpdump-4.6.1/tests
if ~/tcpdump-4.6.1/tests/TESTrun.sh | grep '^.*\s0.*failed.*$'
        then printf "\n\n${blue}Tests ran successfully. Press Enter to continue.${normal}\n\n"
        read
else
        printf "\n\n${blue}Tests failed. Something is wrong and you should figure that out.${normal}\n\n" && exit 0
fi
popd

#install and go back to original dir

pushd ~/tcpdump-4.6.1
sudo make install
popd

### run tcpdump for something to test it.
sudo timeout --foreground 10s tcpdump -w test.pcap
if [ -s test.pcap ]
        then printf "\n\n${blue}tcpdump is working!${normal}\n\n"
fi
