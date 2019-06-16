# Apache, htaccess

## Redirection HTTPS

```apacheconfig
  RewriteCond %{HTTP_HOST} !^boucard-horticulture.lndo.site$
  RewriteCond %{HTTP_HOST} .
  RewriteCond %{HTTP_HOST} !^www\. [NC]
  RewriteRule ^ https://www.%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

  RewriteCond %{HTTP_HOST} !^boucard-horticulture.lndo.site$
  RewriteCond %{HTTPS} off
  RewriteCond %{HTTP:X-Forwarded-Proto} !https
  RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
```

