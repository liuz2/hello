# CSS of SVG

```html
<svg width="240" height="240" xmlns="http://www.w3.org/2000/svg">
    <circle id="backdrop" r="90" cy="120" cx="120" stroke-width="3" stroke="#333" fill="none"/>
    <circle id="progress" r="90" cy="120" cx="120" stroke-width="4" stroke="red"  fill="none"/>
</svg>
```

```css
#progress {
    stroke-dasharray: 100px;
    stroke-dashoffset: 100px;
    animation: progressAnimation 600ms linear infinite;
    transition: stroke-dasharray 400ms linear;
}

@keyframes progressAnimation {
    from {
        stroke-dashoffset: 100px;
    }

    to {
        stroke-dashoffset: 300px;
    }
}
```

## stroke-dasharray

The `stroke-dasharray` attribute is a presentation attribute defining the pattern of dashes and gaps used to paint the outline of the shape.

## stroke-dashoffset

The `stroke-dashoffset` attribute is a presentation attribute defining an offset on the rendering of the associated dash array.

## REF

1. [Pure SVG Progress Circles](https://journal.alexpate.uk/pure-svg-progress-circles/), by *Alex Pate*, 2016/04/12
1. [stroke-dasharray](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dasharray) - SVG | MDN
1. [stroke-dashoffset](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dashoffset) - SVG | MDN
