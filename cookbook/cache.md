# Cache

## Supprimer tout cache d'un block

```php
class MonBlock extends DrupBlockBase {
    use UncacheableDependencyTrait;
}
```

## Gérer via des tags

```php
/**
 * {@inheritdoc}
 */
public function getCacheTags() {
    $customTags = ['preorder_entity_list'];
    $tags = DrupBlock::getDefaultCacheTags() + $customTags;
    
    return Cache::mergeTags(parent::getCacheTags(), $tags);
}
```