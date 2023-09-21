#!/bin/bash
# Tested on fresh install kali-linux-2023-W38-vmware-amd64
# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

while true; do
  # Prompt the user for input and store it in lowercase
  read -p "Do you want to run 'apt update && apt upgrade'? (yes/no): " choice
  choice_lc=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

  # Check if the input is "no" and skip the update and upgrade if so
  if [[ "$choice_lc" == "no" ]]; then
    echo "Skipping the update and upgrade."
    break
  elif [[ "$choice_lc" == "yes" ]]; then
    # Run the update and upgrade
    apt update
    apt upgrade -y  # The '-y' flag automatically answers 'yes' to prompts
    break
  else
    echo "Invalid input. Please enter 'yes' or 'no'."
  fi
done

while true; do
  # Prompt the user for input and store it in lowercase
  read -p "Do you want to run 'apt install tmux -y'? (yes/no): " choice
  choice_lc=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

  # Check if the input is "no" and skip the update and upgrade if so
  if [[ "$choice_lc" == "no" ]]; then
    echo "Skipping the install."
    break
  elif [[ "$choice_lc" == "yes" ]]; then
    # Run the update and upgrade
    apt update
    apt upgrade -y  # The '-y' flag automatically answers 'yes' to prompts
    break
  else
    echo "Invalid input. Please enter 'yes' or 'no'."
  fi
done

# Install Ansible
pip3 install ansible
pip3 install uploadserver

# Define the path to your Ansible playbook YAML file
playbook_file="/home/kali/playbook.yml"

# Check if the Ansible playbook file exists
if [ ! -f "$playbook_file" ]; then
  echo "Error: Ansible playbook file not found at $playbook_file"
  exit 1
fi

# Install Ansible roles from requirements.yml
ansible-galaxy install -r /home/kali/requirements.yml

# Run the Ansible playbook
ansible-playbook "$playbook_file"

# Install additional packages (adjust package names as needed)
apt-get install feroxbuster gobuster xbuild peass jq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin eyewtiness gdb cupp gdb pipx evolution dbeaver xxd chromium xclip neo4j bloodhound hexedit golang-go kleopatra rlwrap open-vm-tools-desktop kali-linux-core kali-linux-firmware kali-desktop-xfc kali-linux-default python3-poetry -y

cd /opt/
# Other Tools
git clone https://github.com/GhostPack/Certify.git 
git clone https://github.com/ly4k/Certipy.git 
git clone https://github.com/Bashfuscator/Bashfuscator.git 
git clone https://github.com/jpillora/chisel.git 
git clone https://github.com/Nekmo/dirhunt.git 
cd /opt/dirhunt/ && sudo pip3 install dirhunt && cd /opt/
git clone https://github.com/login-securite/DonPAPI.git 
git clone https://github.com/RedSiege/EyeWitness.git
git clone https://github.com/michenriksen/aquatone.git
git clone https://github.com/nicocha30/ligolo-ng.git
go build -o agent cmd/agent/main.go
go build -o proxy cmd/proxy/main.go
# Build for Windows
GOOS=windows go build -o agent.exe cmd/agent/main.go
GOOS=windows go build -o proxy.exe cmd/proxy/main.go
cd ligolo-ng
cd /opt
git clone https://github.com/CiscoCXSecurity/linikatz.git
git clone https://github.com/whotwagner/logrotten.git
git clone https://github.com/Ridter/noPac.git
git clone https://github.com/DominicBreuker/pspy.git
git clone https://github.com/skelsec/pypykatz.git
git clone https://github.com/insidetrust/statistically-likely-usernames.git
git clone https://github.com/TheRook/subbrute.git
git clone https://github.com/urbanadventurer/username-anarchy.git
git clone https://github.com/s0md3v/XSStrike.git
git clone https://github.com/enjoiz/XXEinjector.git
git clone https://github.com/adrecon/ADRecon.git
git clone https://github.com/BloodHoundAD/SharpHound.git
cd SharpHound && xbuild Sharphound.sln
cd /opt
git clone https://github.com/ParrotSec/mimikatz.git
git clone https://github.com/Kevin-Robertson/Invoke-TheHash.git
git clone https://github.com/Group3r/Group3r.git
git clone https://github.com/Kevin-Robertson/Inveigh.git
xbuild Inveigh/Inveigh.sln
git clone https://github.com/ohpe/juicy-potato.git && xbuild juicy-potato/JuicyPotato/JuicyPotato.sln
git clone https://github.com/antonioCoco/RoguePotato.git && xbuild RoguePotato/RoguePotato.sln
git clone https://github.com/PowerShellMafia/PowerSploit.git && xbuild PowerSploit/PowerSploit.sln
git clone https://github.com/itm4n/PrintSpoofer.git && xbuild PrintSpoofer/PrintSpoofer.sln
git clone https://github.com/GhostPack/Rubeus.git && xbuild Rubeus/Rubeus.sln
git clone https://github.com/Arvanaghi/SessionGopher.git
git clone https://github.com/SnaffCon/Snaffler.git && xbuild Snaffler/UltraSnaffler.sln && xbuild Snaffler/Snaffler.sln

echo "Install Complete"








