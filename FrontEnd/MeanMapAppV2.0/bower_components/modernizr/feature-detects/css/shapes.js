/*!
{
  "name": "CSS Shapes",
  "property": "shapes",
  "tags": ["css"],
  "notes": [{
    "name": "CSS Shapes W3C specification",
    "href": "http://www.w3.org/TR/css-shapes"
  },{
    "name": "Examples from Adobe",
    "href": "http://html.adobe.com/webplatform/layout/shapes"
  }, {
    "name": "Samples showcasing uses of Shapes",
    "href": "http://codepen.io/collection/qFesk"
  }]
}
!*/
define(['Modernizr', 'testAllProps'], function(Modernizr, testAllProps) {
  Modernizr.addTest('shapes', testAllProps('shapeOutside', 'content-box', true));
});
