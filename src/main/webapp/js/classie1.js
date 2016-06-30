/*!
 * classie - class helper functions
 * from bonzo https://github.com/ded/bonzo
 * 
 * classie.has( elem, 'my-class' ) -> true/false
 * classie.add( elem, 'my-new-class' )
 * classie.remove( elem, 'my-unwanted-class' )
 * classie.toggle( elem, 'my-class' )
 */

/*jshint browser: true, strict: true, undef: true */
/*global define: false */

( function( window ) {

'use strict';

// class helper functions from bonzo https://github.com/ded/bonzo

function classReg( className ) {
  return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
}

// classList support for class management
// altho to be fair, the api sucks because it won't accept multiple classes at once
var hasClass, addClass, removeClass;

if ( 'classList' in document.documentElement ) {
  hasClass = function( elem1, c ) {
    return elem1.classList.contains( c );
  };
  addClass = function( elem1, c ) {
    elem1.classList.add( c );
  };
  removeClass = function( elem1, c ) {
    elem1.classList.remove( c );
  };
}
else {
  hasClass = function( elem1, c ) {
    return classReg( c ).test( elem1.className );
  };
  addClass = function( elem1, c ) {
    if ( !hasClass( elem1, c ) ) {
      elem1.className = elem1.className + ' ' + c;
    }
  };
  removeClass = function( elem1, c ) {
    elem1.className = elem1.className.replace( classReg( c ), ' ' );
  };
}

function toggleClass( elem1, c ) {
  var fn = hasClass( elem1, c ) ? removeClass : addClass;
  fn( elem1, c );
}

var classie = {
  // full names
  hasClass: hasClass,
  addClass: addClass,
  removeClass: removeClass,
  toggleClass: toggleClass,
  // short names
  has: hasClass,
  add: addClass,
  remove: removeClass,
  toggle: toggleClass
};

// transport
if ( typeof define === 'function' && define.amd ) {
  // AMD
  define( classie );
} else {
  // browser global
  window.classie = classie;
}

})( window );
