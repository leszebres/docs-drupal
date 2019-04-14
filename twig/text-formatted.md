# Textes formatés

## PHP

    '#body' => [
        '#type' => 'processed_text',
        '#text' => $this->configValues['body']['value'],
        '#format' => $this->configValues['body']['format']
    ]

## Twig

    {{ body }}