# Introduction
Source for the ScPrime docker image at https://cloud.docker.com/repository/docker/afdy/siaprime

# ScPrime
See the official site at https://scpri.me/

Rent out your hard disk space to earn spare cash, or buy cheap disk space. Encourage a distributed world and avoid mega corporations owning all your data.

# Notes
* To start the daemon:
  `docker run -d --name=scprime -v /my/local/disk/sp:/sp -p 4282:4282 -p 4284:4284 -p 4284:4284 --restart=unless-stopped afdy/siaprime`
* Replace ```/my/local/disk``` with the path to your spare persistent storage.
* Additionally pass ```-p 4280:4280``` if you really want to expose the API port (avoid!).
* It'll take a while to sync with the network before it becomes operational (dependent on your disk speed).
* You'll need to setup your wallet with some coins to host...
* Optionally to unlock your wallet on startup, add to the docker run line ```-e SCPRIME_WALLET_PASSWORD=YourSecretPassword``` (NB: Assume you understand the security risks, and you're the only one with physical and logical access)

Common commands in case you need some help!

# Jump on the CLI of the node:
`docker exec -it scprime bash`

# See client sync status.
`spc`

# See host configuration
`spc host -v`

# Set an initial host configuration to seed.
    spc host config maxcollateral 60 SCP
    spc host config collateralbudget 4 KS
    spc host config minstorageprice 10 SCP
    spc host config collateral 17.5 SCP
  
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
