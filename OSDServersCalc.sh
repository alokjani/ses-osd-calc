#!/bin/bash
# wvera@suse.com

Usage() {
  echo -e "\nSES: OSD Nodes calculator"
  echo -e "Usage: $0\n\n<OSDs on server>\n<TB of OSDs> \
  \n<Block Size>\n<How many TB needs to serve?> \
  \n<How many replicas?>\n"
  exit 0
}
[ $# -eq 5 ] || Usage
OSDtotal="$1"
TBxosd="$2"
BS="$3"
ServeTB="$4"
Reptotal="$5"
OSDNodes=$(printf "%.0f\n" \
  $(echo "scale = 2; $ServeTB/($OSDtotal*$TBxosd*$BS)*$Reptotal" | bc))
  echo -e "You need approximately: $OSDNodes nodes,\
 with $OSDtotal OSD, $TBxosd TB each one\nTo serve:\
 $ServeTB TB with $Reptotal replicas"
