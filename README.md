# Introduction
Source for the SiaPrime docker image at https://cloud.docker.com/repository/docker/afdy/siaprime

# SiaPrime?
See the official site at https://siaprime.net/

Rent out your hard disk space to earn spare cash, or buy cheap disk space. Encourage a distributed world and avoid mega corporations owning all your data.

# Notes
* Replace /my/local/disk with the path to your spare persistent storage.
* Additionally pass -p 5580:5580 if you really want to expose the API port (avoid!).
* It'll take a while to sync with the network before it becomes operational (dependent on your disk speed).
* You'll need to setup your wallet with some coins to host...
* Optionally to unlock your wallet on startup, add to the docker run line -e SIAPRIME_WALLET_PASSWORD=YourSecretPassword (NB: Assume you understand the security risks, and you're the only one with physical and logical access)
* To start the daemon:
  docker run -d --name=siaprime -v /my/local/disk/hs:/hs -p 5581:5581 -p 5582:5582 --restart=always afdy/siaprime

Common commands in case you need some help!

# Jump on the CLI of the node:
docker exec -it siaprime bash

# See client sync status.
spc

# See host configuration
spc host -v

# Set an initial host configuration to seed.
spc host config collateral 50S spc host config mincontractprice 5S spc host config mindownloadbandwidthprice 25S spc host config minstorageprice 100S spc host config minuploadbandwidthprice 25S

# Setup your wallet (You'll need coins to host).
spc wallet init NB: Write down your seed and keep in a safe place, do not share. spc wallet get-address

# Check your 'netaddress' is discovered and present ok, or set it manually.
spc | egrep netaddress spc host config netaddress <Your IP address>:4282

Check your install can be seen from the internet!
Use a service like http://www.canyouseeme.org/ to check 4282 responds. If it does, hey presto, you're in business. If not, you have some diagnostics to do - is port forwarding working on your router?

# Announce your host as available!
spc host announce

Happy hosting. Now tell your friends. :)

# Feedback, questions or suggestions?
Email adam@fordys.net Feeling generous and grateful? Donate some SPC to 9e6f5fd028ed107a687c61cb8f2a6a01a0f8bcce727e5d1030a7cc09591af584caccb2433eaa and perhaps one day I can give up the day job and do useful things all day long! :)
