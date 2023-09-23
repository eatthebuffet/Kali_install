# Kali_install

Run these commands:
```
apt install ansible
ansible-playbook main.yml
```

https://www.kali.org/docs/containers/installing-docker-on-kali/

 ```
printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list &&    curl -fsSL https://download.docker.com/linux/debian/gpg |   sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg &&   sudo apt update
```
