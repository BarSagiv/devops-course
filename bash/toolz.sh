#!/bin/bash

# ==============================================================================
# toolz - A Multi-Tool System Utility Script
# Author: [Your Name]
# Description: Combines common system administration tasks into a single CLI tool.
# ==============================================================================

# === Color Variables ===
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# === Usage ===
show_help() {
  echo -e "${CYAN}Usage: toolz [OPTION]${NC}"
  echo -e "${YELLOW}Options:${NC}"
  echo -e "  -f        Find helper (guided file search)"
  echo -e "  -s        Show system information"
  echo -e "  -p        Process management tool"
  echo -e "  -u        User management utilities"
  echo -e "  -h        Display this help message"
  echo -e "${YELLOW}Examples:${NC}"
  echo -e "  ./toolz -f     # Start interactive find helper"
  echo -e "  ./toolz -s     # Show system stats"
  echo -e "  ./toolz -p     # Manage processes"
  echo -e "  ./toolz -u     # View user info"
}

# === Find Helper ===
find_helper() {
  echo -e "${GREEN}--- Find Helper ---${NC}"
  read -rp "Enter search directory [default: .]: " dir
  dir=${dir:-.}

  read -rp "Enter filename pattern (e.g., *.log): " pattern
  if [[ -z $pattern ]]; then
    echo -e "${RED}Pattern cannot be empty.${NC}"
    return
  fi

  read -rp "Find files only? [y/n]: " files_only
  extra=""
  [[ "$files_only" =~ ^[Yy]$ ]] && extra="-type f"

  echo -e "${YELLOW}Running: find \"$dir\" -name \"$pattern\" $extra${NC}"
  find "$dir" -name "$pattern" $extra
}

# === System Info ===
system_info() {
  echo -e "${GREEN}--- System Information ---${NC}"
  echo -e "${YELLOW}Memory:${NC}"
  free -h
  echo -e "${YELLOW}Disk Usage:${NC}"
  df -h
  echo -e "${YELLOW}Running Processes:${NC}"
  ps -e --no-headers | wc -l
}

# === Process Management ===
process_manager() {
  echo -e "${GREEN}--- Process Management ---${NC}"
  echo -e "${CYAN}Sort by:${NC}"
  echo "1) CPU"
  echo "2) Memory"
  echo "3) Runtime"
  read -rp "Choose an option [1-3]: " opt

  case $opt in
    1) sort="pcpu";;
    2) sort="pmem";;
    3) sort="etime";;
    *) echo -e "${RED}Invalid option.${NC}"; return;;
  esac

  ps aux --sort=-$sort | head -n 15

  read -rp "Kill a process? Enter PID or leave blank: " pid
  if [[ -n $pid ]]; then
    read -rp "Are you sure you want to kill PID $pid? [y/N]: " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      kill "$pid" && echo -e "${GREEN}Process $pid killed.${NC}" || echo -e "${RED}Failed to kill $pid.${NC}"
    fi
  fi
}

# === User Management ===
user_manager() {
  echo -e "${GREEN}--- User Management ---${NC}"
  echo -e "${YELLOW}Logged in users:${NC}"
  who

  echo -e "${YELLOW}User activity:${NC}"
  w

  read -rp "Enter a username for detailed info (or leave blank): " uname
  if [[ -n $uname ]]; then
    id "$uname"
    last "$uname" | head -n 5
  fi
}

# === Menu (if no arguments passed) ===
menu_interface() {
  echo -e "${CYAN}Welcome to toolz - Multi-tool CLI Utility${NC}"
  echo "1) Find Helper"
  echo "2) System Info"
  echo "3) Process Manager"
  echo "4) User Manager"
  echo "5) Help"
  echo "0) Exit"
  read -rp "Choose an option [0-5]: " choice

  case $choice in
    1) find_helper ;;
    2) system_info ;;
    3) process_manager ;;
    4) user_manager ;;
    5) show_help ;;
    0) exit 0 ;;
    *) echo -e "${RED}Invalid choice.${NC}" ;;
  esac
}

# === Main ===
if [[ $# -eq 0 ]]; then
  menu_interface
  exit
fi

while getopts ":fspuh" opt; do
  case $opt in
    f) find_helper ;;
    s) system_info ;;
    p) process_manager ;;
    u) user_manager ;;
    h) show_help ;;
    \?) echo -e "${RED}Invalid option: -$OPTARG${NC}" >&2; show_help ;;
  esac
done
