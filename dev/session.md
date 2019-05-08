# Session

## Service : 

- **tempstore.shared** : pour tous les users anonymes ou connectés (tmp)
- **user.private_tempstore** : pour les users connectés (tmp)

## SET :

    $userSession = \Drupal::service('SERVICE')->get('drup');
    $userSession->set('key', $value);

## GET :

    $userSession = \Drupal::service('SERVICE')->get('drup');
    $value = $userSession->get('key');