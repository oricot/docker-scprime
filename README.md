# Introduction
Source for the SiaPrime docker image at https://cloud.docker.com/repository/docker/afdy/siaprime

# SiaPrime?
See the official site at https://siaprime.net/

Rent out your hard disk space to earn spare cash, or buy cheap disk space. Encourage a distributed world and avoid mega corporations owning all your data.

# Notes
* To start the daemon:
  `docker run -d --name=siaprime -v /my/local/disk/sp:/sp -p 4281:4281 -p 4282:4282 --restart=always afdy/siaprime`
* Replace ```/my/local/disk``` with the path to your spare persistent storage.
* Additionally pass ```-p 4280:4280``` if you really want to expose the API port (avoid!).
* It'll take a while to sync with the network before it becomes operational (dependent on your disk speed).
* You'll need to setup your wallet with some coins to host...
* Optionally to unlock your wallet on startup, add to the docker run line ```-e SIAPRIME_WALLET_PASSWORD=YourSecretPassword``` (NB: Assume you understand the security risks, and you're the only one with physical and logical access)

Common commands in case you need some help!

# Jump on the CLI of the node:
`docker exec -it siaprime bash`

# See client sync status.
`spc`

# See host configuration
`spc host -v`

# Set an initial host configuration to seed.
    spc host config collateral 50SCP
    spc host config mincontractprice 5SCP
    spc host config mindownloadbandwidthprice 500SCP
    spc host config minstorageprice 3500SCP
    spc host config minuploadbandwidthprice 500SCP

# Setup your wallet (You'll need coins to host).
`spc wallet init`
NB: Write down your seed and keep in a safe place, do not share. 

`spc wallet get-address`

# Check your 'netaddress' is discovered and present ok, or set it manually.
    spc host -v | egrep netaddress
    spc host config netaddress <Your IP address>:4282

# Check your install can be seen from the internet!
Use a service like http://www.canyouseeme.org/ to check 4282 responds. If it does, hey presto, you're in business. If not, you have some diagnostics to do - is port forwarding working on your router?

# Announce your host as available!
`spc host announce`

Happy hosting. Now tell your friends. :)

# Feedback, questions or suggestions?
Email adam@fordys.net
