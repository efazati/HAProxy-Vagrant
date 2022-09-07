# HAProxy - Vagrant
The primary purpose of this project is to demonstrate HAProxy features.

**Technologies:**
- Haproxy
- Nginx
- Ubuntu
- Vagrant

### Run
To run this project, use `run.sh`. and then see https://192.168.56.11

Also after that you can ssh to nodes with this command `vagrant ssh haproxy`


### Requirement
The only thing that you need is Vagrant https://www.vagrantup.com/docs/installation


### Command
```
 echo "show stat" | socat stdio /var/run/lb.sock |cut -d "," -f 1-2,5-10,34-36 | column -s, -t
 echo "set server http_backend/web1 state drain" | sudo socat stdio /var/run/lb.sock
 echo "set server http_backend/web1 state ready" | sudo socat stdio /var/run/lb.sock
```