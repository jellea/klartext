Modernizr.load({
  test: Modernizr.fontface && Modernizr.draganddrop && Modernizr.borderradius && Modernizr.svg && Modernizr.inlinesvg && Modernizr.svgclippaths,
  yep: 'javascripts/droplet.js',
  nope: 'javascripts/sorry.js',
  complete: function() {
    return init();
  }
});
