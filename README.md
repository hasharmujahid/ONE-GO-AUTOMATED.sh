# Hi! 

This is a bash automation script to setup a penetesting enviorment in the cloud.
This Script will install most of the "TOOL OF TRADES" that are used during penetration testing.

STEP 1: EXECUTEABLE PRIVILEGES
* YOU WILL NEED TO GIVE EXECUTABLE PRIVILEGES TO ALL OF THE SCRIPTS.

STEP 2: MUST BE ROOT
* YOUR PRIVILEGE LEVEL MUST BE ROOT TO FULLY INSTALL OR RUN THIS SCRIPT.

STEP 3: SYSUPDATE.sh
* FIRST YOU NEED TO RUN 'sysupdate.sh' TO ENSURE THAT YOUR UBUNTU KERNEL VERSION IS LATEST.
* YOU SHOULD RESTART YOU INSTANCE AFTER THAT OTHERWISE YOU COULD RUN INTO SOME PROBLEMS

STEP 4: GO-INSTALL.sh
* TO INSTALL SOME OF THE TOOLS YOU NEED TO HAVE GO INSTALLED IN YOUR INSTANCE.
* YOU SHOULD RUN THE 'GO-INSTALL.sh' TO MAKE SURE THAT GO IS INSTALLED. 
* THE SCRIPT WILL AUTOMATICALLY SET THE GO IN TO YOU SYSTEM PATH VARIABLE.
* JUST RUN 'go' AFTER THE EXECUTION COMPLETES SCRIPT.

STEP 5: TOOLS-INSTALLATION.sh
* NOW RUN THE "tools-installation.sh".
* MAKE SURE YOU ARE ROOT.
* SOME TOOLS LIKE JOHN THE RIPPER COULD TAKE SOME  TIME BUT DONT WORRY.
* YOU COULD ALSO SKIP THE INSTALLTION OF METASPLOIT FRAMEWORK BY PRESSING N AND ENTER.
* YOU WILL NEED TO SETUP THE API-KEYS FOR SOME TOOLS LIKE HAKTRAILS ETC.

# NOTE:
```
THIS SCRIPT IS ONLY TESTED ON DIGITAL OCEANS UBUNTU {Ubuntu 22.04 x64} DROPLET...
```

TOOLS INCLUDED
```
1: PIP3
2: HTTPX
3: NUCLEI
4: GOBUSTER
5: v3
6: ANEW
7: HAKRAWLER
8: HAKTRAILS
9: SUBFINDER
10: FFUF
11: KXSS
12: HTTPROBE
13: ASSETFINDER
14: WAYBACKURLS
15: GAU
16: IMPACKET
17: RESPONDER
18: SQLMAP
19: NIKTO
20: HASHCAT
21: HYDRA
22: JOHN-THE-RIPPER {bleeding-jumbo john}
23: AMASS
24: WORDLISTS {ROCKYOU.txt}
25: SECLIST
26: METASPLOIT FRAMEWORK {OPTIONAL YOU CAN SKIP IT BY PRESSING 'N'}
27: EXPLOIT-DB
28: WINDOWS PRIVESC TOOLS 
    * MIMIKATZ
    * WINPEAS (BAT,EXE)
    * WATSON.EXE
    * SEATBELT.EXE
    * JUICYPOTATO.EXE
    * POWERUP.PS1
    * POWERVIEW.PS1
29: LINUX PRIVESC TOOLS
    * PSPY (64,32)
    * LINUX-EXPLOIT-SUGGESTER-2.PL
    * LINPEAS.SH
    * LINENUM.SH
30: CRACKMAPEXEC
```