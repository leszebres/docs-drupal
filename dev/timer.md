# Timer : mesurer le temps d'execution

    Timer::start('mon_timer');
    
    // jobs running
    
    $end = Timer::stop('mon_timer');
    $diff = date('H:i:s', mktime(0, 0, 0, $end['time']/1000));