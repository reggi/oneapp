'use strict';

var NwBuilder = require('node-webkit-builder');

var nw = new NwBuilder({
  files: './build/node-webkit/src/**', // use the glob format
  platforms: ['osx', 'linux64', 'win'],
  buildDir: './build/node-webkit/build',
  cacheDir: './build/node-webkit/cache',
  //macZip: true
  macIcns: './build/node-webkit/src/app_icon.icns'

});

// Log stuff you want
nw.on('log',  console.log);

// Build returns a promise
nw.build().then(function () {
  console.log('all done!');
}).catch(function (error) {
  console.error(error);
});

// And supports callbacks
nw.build(function(err) {
  if (err) {
    console.log(err);
  }
})
