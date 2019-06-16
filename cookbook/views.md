# Views

## Supprimer les doublons des vues

Selon la configuration des vues, les items de listes peuvent apparaître en doublon.
- Via l'interface de la vue, activer le distinct appliquera un `SELECT DISTINCT` ou un `GROUP BY` sur tous les champs, donc inutile.
- Activer l'aggrégation engendrera des pertes de performances.

**Solution :**

Ne pas ajouter l'id des entités via l'admin 

```text
drup_site_views_query_alter(ViewExecutable $view, QueryPluginBase $query) {
    $query->addField('node_field_data', 'nid', 'nid', ['aggregate' => true, 'function' => 'groupby']);
}
```

## Jointure dans un view query 

```text
$definition = [
    'table' => 'reference_entity__field_characteristics',
    'field' => 'entity_id',
    'left_table' => 'reference_entity__field_product_id',
    'left_field' => 'entity_id',
];

$join = \Drupal::service('plugin.manager.views.join')->createInstance('standard', $definition);

$query->addTable('reference_entity__field_characteristics', 'field_product_id_node_field_data', $join, 'reference_entity__field_characteristics');
```

## Récupérer les valeurs exposées dans un views\_exposed\_form\_alter\(\) :

```text
$form_state->get('view')->getExposedInput()
```

## Autres :

[https://www.drupal.org/forum/support/module-development-and-code-questions/2017-10-25/how-to-change-views-exposed-filter](https://www.drupal.org/forum/support/module-development-and-code-questions/2017-10-25/how-to-change-views-exposed-filter)

