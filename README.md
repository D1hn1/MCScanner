# MCScanner

```
Usage:
  root@kali ~# chmod +x mcscanner.sh
  root@kali ~# sudo masscan 0.0.0.0/0 -p25565 --exclude 255.255.255.255 -oL masscan.txt
  root@kali ~# cat masscan.txt | awk '{print $4}' > ips
  root@kali ~# sudo ./mcscanner.sh
```
```
Important:
  You have to create a file named ips
   The results will be saved in a file
```
minecraft-info.nse: https://github.com/sjhilt/Nmap-NSEs/blob/master/minecraft-info.nse
