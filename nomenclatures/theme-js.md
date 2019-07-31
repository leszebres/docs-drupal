# Theme JS

## Nommenclature des fichiers

* theme.js pour l'init
* all.js pour toutes les pages
* theme/form-*.js pour les formulaires
* theme/view-*.js pour les vues
* theme/block-*.js pour les blocs
* utility/my-utility.js pour les utils à charger sur certaines pages

*theme.js* et *all.js* sont les deux seuls fichiers instanciés au chargement de la page.
Tout ce qu'il y a dans *theme/** doit être instancié par un objet via `#attached`.
Tout ce qu'il y a dans *utility/** doit être instancié via `common.load('myUtility');

## Modèle de la librarie JS

```js
(function ($, Drupal) {
    'use strict';

    /**
     * Vue d'exemple
     */
    Drupal.behaviors.viewExample = {
        context: undefined,
        settings: undefined,
        common: undefined,

        elements: {
            view: undefined
        },

        config: {},

        /**
         * Paramètres nécessaires
         */
        prepare: function (context, settings) {
            this.common = Drupal.Theme;
            this.context = context;
            this.settings = settings;

            this.elements.view = $(settings.view_selector);

            return this.elements.view.length > 0;
        },

        /**
         * A l'init
         *
         * @param context
         * @param settings
         */
        attach: function(context, settings) {
            if (this.prepare(context, settings)) {
                $.extend(this.elements, {

                });

                //todo init methods
            }
        }
    };

}(jQuery, Drupal));
```

## Déclarer la librarie JS

```yml
theme-view-example:
  version: '0.1'
  js:
    js/theme/view-credential.js: {}
  dependencies:
    - core/jquery
```

## Appeler la librarie JS

```php
/**
 * Preprocess View
 *
 * @param $variables
 */
function drup_theme_preprocess_views_view(&$variables) {    
    switch ($variables['view']->id()) {
        case 'credential':
            $variables['#attached']['library'][] = 'drup_theme/theme-view-example';
            $variables['#attached']['drupalSettings']['view_selector'] = 'div.view--' . Html::getId($variables['view']->id()) . '.view-display--' . Html::getId($variables['view']->current_display);

            break;
    }
}
```
