# Windows Users Backup – PowerShell + BAT

Jednoduché skripty pro automatické zálohování uživatelských dat ve Windows.

Tento projekt obsahuje BAT a PowerShell variantu pro zálohu důležitých složek jako:

- Desktop
- Documents
- Pictures
- Downloads

Skripty využívají nástroj `robocopy`, který je součástí Windows.

## K čemu je to dobré

Záloha uživatelského profilu pomůže například při:

- přeinstalaci Windows
- problému s diskem
- ztrátě dat
- BitLocker problémech
- migraci na nový počítač

## Video / článek

Článek na blogu:  
https://pc1expert.blogspot.com/2026/02/jak-automaticky-zalohovat-plochu-slozku.html

YouTube kanál:  
https://www.youtube.com/@pc1expert

## 1. BAT varianta

Soubor: `backup-users.bat`

```bat
@echo off

set SRC=C:\Users\%USERNAME%
set DST=E:\Zalohy\%USERNAME%

robocopy "%SRC%\Desktop" "%DST%\Desktop" /MIR /R:1 /W:1
robocopy "%SRC%\Documents" "%DST%\Documents" /MIR /R:1 /W:1
robocopy "%SRC%\Pictures" "%DST%\Pictures" /MIR /R:1 /W:1
