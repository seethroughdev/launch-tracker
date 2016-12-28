require( './styles/main.css' );

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
Elm.Main.embed( document.getElementById( 'main' ) );


// Add Google Analytics
if (window) {
  window.ga=function(){ga.q.push(arguments)};ga.q=[];ga.l=+new Date;
  ga('create','UA-XXXXX-Y','auto');ga('send','pageview');
}
