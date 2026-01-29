#!/usr/bin/env bash

#presun procesu do pozadia, id procesu

#pockaj 5 sekund ale odloz proces do pozadia (&)
sleep 5 &

echo "last process id is $!"
#$! - id naposledy spusteneho procesu
ps -ef | grep "$!" | grep -v grep



# exit code procesov
# 0 - ok "vrati True, prikaz je uspesny"
# cokolvek okrem 0, vysledok predosleho echa

echo "vypisovanie exit codu posledneho"
