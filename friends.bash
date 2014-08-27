#!/bin/bash

touch tried.kl tried.im tried.rl tried.vl tried.wwar tried.rol tried.zl tried.nl

# wc -l codes* tried*

wget -nv --output-document - "http://kingdomslivecodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.kl | sort -u > codes.kl
wget -nv --output-document - "http://imobstersmobcodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.im | sort -u > codes.im
wget -nv --output-document - "http://racinglivecodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.rl | sort -u > codes.rl
wget -nv --output-document - "http://vampireslivecodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.vl | sort -u > codes.vl
wget -nv --output-document - "http://worldwaralliancecodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.wwar | sort -u > codes.wwar
wget -nv --output-document - "http://rockstarslivecodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.rol | sort -u > codes.rol
wget -nv --output-document - "http://livecodes.info/Game:ZombiesLive_1" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.zl | sort -u > codes.zl
wget -nv --output-document - "http://ninjaslivecodes.com/" | grep -o "\b[A-Z0-9]\{5,6\}\b" | grep -v -f tried.nl | sort -u > codes.nl

function action {
  UA="Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3"
  for CODE in $(cat codes.$SERVER)
  do
    wget -U "$UA" -q --output-document /dev/null --header "$COOKIE" "http://$SERVER.storm8.com/group.php" --post-data "mobcode=$CODE&action=Invite"
    echo $CODE >> tried.$SERVER
    echo "Tried $CODE on $SERVER"
  done
}

### KINGDOMS
COOKIE="Cookie: fpts=45; pf=128A6A13B0F27B599683BE80EC3F0C4F; uid=1809413; Version=PointPackage"
SERVER="kl"
action

### IMOBSTERS
COOKIE="Cookie: fpts=20; pf=96837C9C5956493E07D664826C37E1FF; uid=1556111; Version=PointPackage"
SERVER="im"
action

### RACING
COOKIE="Cookie: fpts=25; pf=8FEDD04E5169B1FB094462392BC7F321; uid=3928906; Version=PointPackage"
SERVER="rl"
action
  
### VAMPIRES
COOKIE="Cookie: fpts=15; pf=D79A0F73BE30E340777FE9E50FC06E4D; uid=2330131; Version=PointPackage"
SERVER="vl"
action

### WORLDWAR
COOKIE="Cookie: fpts=15; pf=7119A6BC5606F29EC9B3A95D313CE243; uid=2806138; Version=PointPackage"
SERVER="wwar"
action

### ROCKSTARS
COOKIE="Cookie: fpts=60; pf=E63F2CB07347FD9A49CB9C07C7B5D084; uid=1922200; Version=PointPackage"
SERVER="rol"
action

### ZOMBIES
COOKIE="Cookie: fpts=20; pf=F2878FBB5DDF2663290A9B5ED0D5B89F; uid=2330748; Version=PointPackage"
SERVER="zl"
action

### NINJAS
COOKIE="Cookie: pf=DCD0CFAE748BD5BDFFF5FD94B758B4FA; uid=510905; Version=Paid"
SERVER="nl"
action

