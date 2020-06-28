# mysql-installation-and-configuration

## Remove prompts
Remove prompts so we aren't asked a password during installation

```bash
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"
```
