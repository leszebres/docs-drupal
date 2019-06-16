# Timer : mesurer le temps d'execution

```php
Timer::start('mon_timer');
    
// jobs running

$end = Timer::stop('mon_timer');
$diff = date('H:i:s', mktime(0, 0, 0, $end['time']/1000));
```