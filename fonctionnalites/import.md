# Créer un import

## Télécharger le modèle

{% file src="../.gitbook/assets/module-import.zip" %}


## Principe de fonctionnement

* Instanciation de la classe : définition des ressources necessaires
* Lancement de l'import
* Préparation : requis pour executer l'import
* Opérations : définition des opérations à executer
* Queue : les opérations sont traitées une par une dans une Queue
* A la fin de la queue : un rapport email est envoyé

## Détail du modèle ci-dessus

### 1. Créer un module

```text
module_import/
    src/
        Import/
            MyImport.php
        Plugin/
            QueueWorker/
                MyImportQueueWorker.php
    templates/
        module-import--report-email.html.twig
    module_import.module
```

### 2. Classe d'import

```php
<?php

namespace Drupal\module_import\Import;

use Drupal\Component\Utility\Timer;
use Drupal\Core\Logger\LoggerChannelInterface;
use Drupal\Core\Mail\MailManagerInterface;
use Drupal\Core\Queue\QueueWorkerManager;
use Drupal\Core\Queue\SuspendQueueException;
use Drupal\drup_settings\DrupSettings;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Class MyImport
 *
 * @package Drupal\module_import\Import
 */
class MyImport {

    /**
     * Activation du debug
     *
     * @var bool
     */
    protected static $debug = true;

    /**
     * ID de la tâche (channel watchdog, ...)
     *
     * @var string
     */
    public static $importId = 'module_import';

    /**
     * Nom de la tâche d'import
     *
     * @var string
     */
    public static $importTitle = 'Import à moi';

    /**
     * Types de rapport
     *
     * @var array
     */
    protected static $reportTypes = [
        'total' => 'Total',
        'updated' => 'Mises à jour',
        'skipped' => 'Ignorées'
    ];

    /**
     * @var \Drupal\drup_settings\DrupSettings
     */
    protected static $drupSettings;

    /**
     * @var \Drupal\Core\Mail\MailManagerInterface
     */
    protected static $mailManager;

    /**
     * @var \Drupal\Core\Logger\LoggerChannelInterface
     */
    protected static $logger;

    /**
     * @var \Drupal\Core\Queue\QueueWorkerManager
     */
    protected static $queueManager;

    /**
     * Liste des opérations à executer
     *
     * @var array
     */
    protected $operations = [];

    /**
     * Données du rapport d'import
     *
     * @var array
     */
    public static $report = [];

    /**
     * Variable drupSettings où sont renseignées les emails recevant les rapports
     *
     * @var string
     */
    protected static $drupSettingsReportEmail = 'module_import_report_email';


    /**
     * Constructeur
     */
    public function __construct(DrupSettings $drupSettings, MailManagerInterface $mailManager, LoggerChannelInterface $logger, QueueWorkerManager $queueManager) {
        self::$drupSettings = $drupSettings;
        self::$mailManager = $mailManager;
        self::$logger = $logger;
        self::$queueManager = $queueManager;
    }

    /**
     * {@inheritdoc}
     */
    public static function create(ContainerInterface $container) {
        return new static(
            $container->get('drup_settings'),
            $container->get('plugin.manager.mail'),
            $container->get('logger.factory')->get(self::$importId),
            $container->get('plugin.manager.queue_worker')
        );
    }

    /**
     * Détermine si on est en mode debug
     *
     * @return bool
     */
    public function isDebug(): bool {
        return self::$debug;
    }

    /**
     * Exécution de la tâche
     *
     * @return bool
     */
    public function run() {
        // Début
        Timer::start(self::$importId);
        self::setLog('------------------------------');
        self::setLog('Début de la tâche ' . self::$importTitle);

        if ($this->prepare()) {
            return $this->queue();
        }

        // Import vide
        self::setLog('La tâche ne contient aucune opération à exécuter.', 'warning');
        self::logEnd();

        return false;
    }

    /**
     * Préparation des données nécessaires à l'exécution de l'import
     *
     * @return bool
     */
    protected function prepare() {
        if ($this->setOperations()) {
            return true;
        }

        return false;
    }

    /**
     * Éxecution de la Queue
     *
     * @return bool
     */
    public function queue() {
        $queue = \Drupal::queue(self::$importId . '_queue');

        // Nettoyage de la queue si relance après erreurs
        if ($queue->numberOfItems() > 0) {
            $queue->deleteQueue();
        }

        $queue->createQueue();
        $operations = $this->getOperations();

        if (!empty($operations)) {
            $queueWorker = self::$queueManager->createInstance(self::$importId . '_queue_worker');

            // Ajout des éléments dans la queue
            foreach ($operations as $element) {
                $queue->createItem($element);
            }
            unset($operations, $this->operations);

            // Pour chaque éléments dans la queue
            while ($item = $queue->claimItem()) {
                try {
                    $queueWorker->processItem($item->data);
                    $queue->deleteItem($item);
                }
                catch (SuspendQueueException $error) {
                    $queue->releaseItem($item);
                    self::setLog($error, 'error');
                    break;
                }
                catch (\Exception $error) {
                    self::setLog($error, 'error');
                }
            }
        }

        $queue->deleteQueue();

        return true;
    }

    /**
     * Ajout des opérations à traiter
     *
     * @return bool
     */
    protected function setOperations() {
        // Reset
        $this->operations = [];

        // En mode debug, on ne traite que la 1ère opération
        if ($this->isDebug()) {
            //todo Faire une limitation pour le débug
        }

        // Ajout des opérations
        // todo Créer les opérations des données à traiter
        $items = [];
        foreach ($items as $item) {
            $this->operations[] = [[__CLASS__, 'onOperation'], [$item]];
        }

        // Ajout de l'opération de fin
        if (!empty($this->operations)) {
            $this->operations[] = [[__CLASS__, 'onFinish'], [true]];
        }

        return !empty($this->operations);
    }

    /**
     * Récupération des opérations à exécuter
     *
     * @return array
     */
    public function getOperations() {
        return $this->operations;
    }

    /**
     * todo à renommer au besoin
     */
    public static function onOperation($item) {

    }

    /**
     * A la fin de l'import
     *
     * @param $success
     */
    public static function onFinish($success) {
        // Rapport email
        $data = [];
        if (!empty(self::$report)) {
            foreach (self::$reportTypes as $type => $name) {
                $data[$type] = [
                    'title' => $name,
                    'items' => []
                ];
                if (isset(self::$report[$type])) {
                    $data[$type]['items'] = self::$report[$type];
                }
            }
        }

        // Templates
        $renderParams = [
            '#theme' => self::$importId . '__report_email',
            '#title' => self::$importTitle,
            '#report' => $data
        ];
        $params = [
            'headers' => [],
            'to' => self::$drupSettings->getValue(self::$drupSettingsReportEmail) ?: 'dev@leszebres.fr',
            'subject' => self::$importTitle,
            'message' => \Drupal::service('renderer')->renderPlain($renderParams)
        ];

        // Envoi email
        $result = self::$mailManager->mail('module_import', self::$importId . '_report', $params['to'], 'fr', $params, null, true);

        if ($result['result']) {
            self::setLog('Rapport envoyé par email à ' . $params['to']);
        }

        // Message
        if ($success) {
            \Drupal::messenger()->addStatus('La tâche ' . self::$importTitle . ' a été exécutée avec succès.');
        } else {
            \Drupal::messenger()->addError('Échec d\'exécution de la tâche ' . self::$importTitle);
        }

        // Fin
        self::logEnd();
    }

    /**
     * Alias pour créer un log
     *
     * @param $message
     * @param string $type
     */
    public static function setLog($message, string $type = 'notice') {
        self::$logger->{$type}($message);
    }

    /**
     * Ajout une entrée dans le rapport
     *
     * @param string $type
     * @param mixed $data
     */
    public static function setReport(string $type, $data) {
        if (!isset(self::$report[$type])) {
            self::$report[$type] = [];
        }

        self::$report[$type][] = $data;
    }

    /**
     * Log de fin de tâche
     */
    public static function logEnd() {
        // Fin
        if ($end = Timer::stop(self::$importId)) {
            self::setLog('Fin de la tâche ' . self::$importTitle . ' (durée : ' . date('H\hi\ms\s', mktime(0, 0, $end['time']/1000)) . ').');
        }
        self::setLog('------------------------------');
    }
}
```

### 3. Créer un QueueWorker

```php
<?php

namespace Drupal\module_import\Plugin\QueueWorker;

use Drupal\Core\Queue\QueueWorkerBase;

/**
 * Class MyImportQueueWorker
 *
 * @package Drupal\module_import\Plugin\QueueWorker
 *
 * @QueueWorker(
 *   id = "module_import_queue_worker",
 *   title = @Translation("Import à moi")
 * )
 */
class MyImportQueueWorker extends QueueWorkerBase {

    /**
     * @param mixed $item
     */
    public function processItem($item) {
        [$function, $operation] = $item;
        [$data] = $operation;

        $function($data);
    }
}

```

### 4. Template du rapport d'import

```text
<tr>
    <td>
        <h3>{{ title }}</h3>
    </td>
</tr>
<tr><td height="20"></td></tr>

{% for type, group in report %}
    <tr><td height="10"></td></tr>
    <tr><td height="1" class="mail-border-secondary"></td></tr>
    <tr><td height="10"></td></tr>
    <tr>
        <td><h4>{{ group.title }} : {{ group.items|length }}</h4></td>
    </tr>
    {% if group.items is not empty and (type != 'total') %}
        <tr>
            <td>
                {% for item in group.items %}
                    {{ item.getName() }}<br/>
                {% endfor %}
            </td>
        </tr>
        <tr><td height="10"></td></tr>
    {% endif %}
{% endfor %}
```

### 5. Déclaration des hooks dans le .module

```php
<?php

use Drupal\module_import\Import\MyImport;

/**
 * Implements hook_theme().
 */
function module_import_theme($existing, $type, $theme, $path) {
    return [
        MyImport::$importId . '__report_email' => [
            'variables' => [
                'title' => null,
                'report' => []
            ]
        ]
    ];
}

/**
 * Implements hook_mail().
 */
function module_import_mail($key, &$message, $params) {
    // Global
    $message['headers']['Content-Type'] = SWIFTMAILER_FORMAT_HTML;
    $message['body'][] = $params['message'];

    if ($key === MyImport::$importId . '_report') {
        $message['subject'] = $params['subject'];
    }
}

/**
 * Implements hook_cron().
 */
function module_import_cron() {
    $import = MyImport::create(\Drupal::getContainer());
    $import->run();
}

```

