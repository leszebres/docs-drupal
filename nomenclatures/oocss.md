# OOCSS

## Modules avec enfants

**Exemples :**

* list
* slider
* nav
* accordion

module : class=”module module--variante l-layout is-state theme-theme” enfant direct : class=”module-item” éléments de l’enfant : “item-nom”

### Listes

```text
.list.list--primary
   .list-item
       a
           article.item-wrapper
header.item-header
   h2.item-title
   p.item-subtitle
   p.item-tag

div.item-media l-image/
   img/iframe…
   span.item-background (si img en bg)

div.item-content
   p.item-desc

footer.item-footer
   span.item-cta.btn--more
```

### Navigation

```text
div.nav (ou nav.nav si nav--primary)
   ul.nav-menu
       li.nav-item
           p.item-title
           p.item-subtitle 
           …
```

### Slider

```text
div.slider
   div.slider-item
       div.item-image ou div.item-background 
       div.item-wrapper(.row)
           a
           p.item-title
           p.item-subtitle
           div.item-body
               p
           span.item-cta
```

## Modules sans enfants

**Exemples :**

* block
* btn

### Blocks

```text
article.block(.l-narrow)
   .block-wrapper(.row)
       header.block-header
           .block-title
           .block-subtitle
       .block-content
       .block-footer
           .block-link
```

### Btn

```text
.btn(.l-small)
   .btn--content
```

### Node

```text
div.node
   .node-body
   .node-header
   .node-footer
   .node-date
   .node-author
   .node-tag
```

### Paragraph

```text
.paragraph.paragraph--type--
    .paragraph-body
    .paragraph-media
    …
```

## Ordre des propriétés CSS

```text
/* position, boite, taille */
position: absolute;
z-index: 5;
top: 0;
bottom: auto;
left: 0;
right: auto;
transform: scale(1);
display: block;
clear: both;
float: left;
width: 100%;
height: auto;
margin: 0;
padding: 0;
background: #fff;
border: 0;
border-radius: 10px;
box-sizing: border-box;

/* Texte */
color: #FFF;
font-family: Arial, Helvetica, sans-serif;
font-size: 1em;
font-weight: bold;
font-style: italic;
line-height: 1.1;
text-align: center;
text-transform: uppercase;
text-decoration: none;
text-shadow: none;
white-space: nowrap;

/* Autres */
opacity: 1;
overflow: hidden;
box-shadow: none;
transition: .2s;
```

