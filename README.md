# HS100 Smart Plug Energy Tracking

Using [ggeorgovassilis/linuxscripts](https://github.com/ggeorgovassilis/linuxscripts) for the communication to the smart plug.

Creates a csv file (`log.csv`) containing live measurement from the TP-Link Smart Plug

## Usage

```
./hs100logger.sh ipaddress port delayinseconds
```

For example (replace ip with your plug's ip address):

```
./hs100logger.sh 192.168.1.135 9999 5
```

