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

