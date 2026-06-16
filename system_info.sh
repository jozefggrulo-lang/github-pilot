#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

clear
echo -e "${RED}      .::.   .:::${NC}"
echo -e "${RED}       :::   :::${NC}"
echo -e "${RED}       :::   :::${NC}"
echo -e "${RED}       .::   ::.${NC}"
echo -e "${RED}      .::.   .::.${NC}"
echo -e "=================================================="
echo -e "         KALI LINUX (Debian Base)        "
echo -e "=================================================="

echo -e "${YELLOW}[STAV ÚLOŽISKA / DISK SPACE]${NC}"
df -h / | grep -E 'Filesystem|/'

echo ""
echo -e "${YELLOW}[KOMUNIKÁCIA S NÁSTROJMI - DOSTUPNOSŤ]${NC}"

check_tool() {
    local name=$1
    local cmd=$2
    if command -v $cmd &> /dev/null; then
        echo -e " ${GREEN}✓${NC} $name - ${GREEN}PRIPRAVENÝ${NC}"
    else
        echo -e " ${RED}✗${NC} $name - ${RED}NEDOSTUPNÝ${NC}"
    fi
}

check_dir() {
    local name=$1
    local dir=$2
    if [ -d "$dir" ]; then
        echo -e " ${GREEN}✓${NC} $name - ${GREEN}PRIPRAVENÝ${NC}"
    else
        echo -e " ${RED}✗${NC} $name - ${RED}CHÝBA${NC}"
    fi
}

check_file() {
    local name=$1
    local file=$2
    if [ -f "$file" ]; then
        echo -e " ${GREEN}✓${NC} $name - ${GREEN}ZABEZPEČENÝ${NC}"
    else
        echo -e " ${RED}✗${NC} $name - ${RED}NEODHALENÝ${NC}"
    fi
}

# HLAVNÉ SYSTEMOVÉ PROGRAMY
check_tool "Git (Verziovanie a kľúče) " "git"
check_tool "Python3 (Prostredie skriptov)" "python3"
check_tool "Midnight Commander (mc)  " "mc"

# BEZPEČNOSŤ A EXPLOITY
check_tool "Nmap (Sieťový skener)      " "nmap"
check_tool "Hydra (Brute-force)       " "hydra"
check_tool "Sqlmap (SQL injekcie)     " "sqlmap"
check_tool "John (Límač/Cracker hashov)" "john"

# BEZDRÔTOVÝ AUDIT (WIFI)
check_dir  "Wifite2 (Wireless core)   " "$HOME/wifite2"
check_tool "Aircrack-ng (Wifi suite)  " "aircrack-ng"
check_tool "Hashcat (GPU/CPU cracker) " "hashcat"
check_tool "Bully (WPS attack tool)   " "bully"

# PROJEKTY A OSINT
check_dir  "GitHub Pilot (Záloha web) " "$HOME/github-pilot"
check_dir  "Sherlock (OSINT Username)  " "$HOME/sherlock"
check_dir  "Work Tools (Sieťové jadro) " "$HOME/work_tools"

echo ""
FREE_SPACE=$(df -m / | awk 'NR==2 {print $4}')
if [ "$FREE_SPACE" -ge 7577 ]; then
    echo -e " ${BLUE}i${NC} Voľné miesto: $(df -h / | awk 'NR==2 {print $4}') (Optimalizované pre chod systému)"
else
    echo -e " ${YELLOW}▲${NC} Metasploit / Kompletné Kali Tools: Nedostupné"
fi

echo -e "=================================================="
