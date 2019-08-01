# Commandes usuelles

## Corriger les droits

```bash
$ find . -type f -exec chmod 644 {} \; $ find . -type d -exec chmod 775 {} \;
```

## Màj Debian \(9.\*\)

```bash
apt-get update 
apt-get upgrade 
apt-get clean 
apt-get autoclean 
apt-get autoremove --purge
```

### Màj PHP

- https://computingforgeeks.com/how-to-install-php-7-3-on-debian-9-debian-8/
- https://linuxize.com/post/how-to-install-php-on-ubuntu-18-04/
