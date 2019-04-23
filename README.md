balena-ssh
=========
This is a basic balena project that runs dropbear on boot which allows for ssh access. It's currently running a python script, but you could run any language you like as long as there is a continous process running to keep the container open to outside connections, in this case we are running a flask server. 

If your running a node.js project with balena and would like ssh access you should look [here](https://github.com/balena-io-playground/ssh-node).

NOTE: This container enables SSH access as root with a PASSWORD stored in plain text - Do not use in production without modifications.

#### SSH into your device. 

Add an environment variable called PASSWD with the value to set as root password.

![alt text](https://github.com/balena-io-playground/balena-ssh-python/blob/balenalib/img/env.png?raw=true "creating envar")

Then run

```sh
$ ssh root@<YOUR-DEVICE'S-IP>
```

The code you just pushed is kept in the app directory.

```sh
$ cd /usr/src/app
```


At after pushing you may encounter and re-sshing back into the device you may encounter this error message as the host key changes when an update occurs on the device.


```sh
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
```

To get around this remove the key.

```sh
$ ssh-keygen -R <YOUR-DEVICE'S-IP>
```

It will then work as expected

```sh
$ ssh root@<YOUR-DEVICE'S-IP>
```

