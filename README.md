# Kali_install


Disclaimer: The Windows folder is not my work and all of the work goes to the creator.

Run these commands after cloing the repo:
```
sudo apt upgrade && sudo apt update
apt install ansible
ansible-galaxy install gantsign.visual-studio-code
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml
```

