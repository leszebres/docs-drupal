# Mail manager

## Envoyer

```text
$mailManager = \Drupal::service('plugin.manager.mail');
$params = [
    'subject' => 'Sujet de l\'email';
];

$renderParams = [
     '#theme' => 'theme',
     '#var_name' => []
];
$params['message'] = \Drupal::service('renderer')->renderPlain($renderParams);

$result = $mailManager->mail('module', 'module_key', $email_to, $langcode, $params, null, true);

if ($result['result']) {
    //OK
}
```

## Hook mail

```text
/**
 * Implements hook_mail().
 */
function mymodule_mail($key, &$message, $params) {
    // Valeurs par défaut
    $message['headers']['Content-Type'] = SWIFTMAILER_FORMAT_HTML;
    $message['from'] = \Drupal::config('system.site')->get('mail');

    if (isset($params['subject'])) {
        $message['subject'] = $params['subject'];
    }

    $message['body'][] = $params['message'];

    // Surcharge
    switch ($key) {
        case 'module_key':
            $message['from'] = 'custom@email.com';
            $message['params']['attachments'] = $params['attachments'];
            break;
    }
}
```

