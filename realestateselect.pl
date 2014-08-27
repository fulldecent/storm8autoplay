#!/usr/bin/perl

@file = <STDIN>;
$flat = "@file";
#$flat =~ s/\n//g;

$flat =~ m|<span id="cashCurrent" style="white-space:nowrap">([0-9,]*)</span>|;
#@flat =~ m|a| or die('fail');

$cash = $1;
$cash =~ s/,//g;

print STDERR "-- CASH = $cash --\n";

########

$bestpayback = 9999;
$bestcost = 0;
$bestid = "";

while ($flat =~ m/<div class="reName[^>]*>([^<]+)[^&]*Income[^&]*(\$|>)([0-9,]+)<[^&]*(\$|>)([0-9][0-9milkKM., ]+)[^&]*&inv_id=([0-9]+)/g)
{
  $name = $1;
  $inc = $3;
  $cost = $5;
  $id = $6;
  $inc =~ s/,//g;
  $cost =~ s/,//g;
  $cost =~ s/\.([0-9][0-9])K/${1}0/g;
  $cost =~ s/\.([0-9])K/${1}00/g;
  $cost =~ s/K/000/g;
  $cost =~ s/\.([0-9][0-9]) ?mil/${1}0000/g;
  $cost =~ s/\.([0-9]) ?mil/${1}00000/g;
  $cost =~ s/ mil/000000/g;
  $payback = $cost / $inc;

  if ($payback < $bestpayback)
  {
    $bestpayback = $payback;
    $bestcost = $cost;
    $bestid = $id;
  }

#  print STDERR  "\"$name\", $inc, $cost, $payback, $id\n";
  print STDERR sprintf("%02d",$id)." ".pack("A13",$name)."$inc\t$cost\t$payback\n";
}

if ($cash > $bestcost)
{
  print STDERR "===> CHOOSE payback $bestpayback, cost $bestcost\n";
  print "$bestid\n";
}


