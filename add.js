/*eslint-disable*/
// Input source file used to generate multiple different dist/map pairings.
// See ../../webpack.config.js.

var someMap = {
    '1': 1,
    '2': 2
  };
  
function add() {
    throw new Error('noooo');
    return [].slice(arguments).reduce(function(sum, x) {
        return sum + x;
    }, 0);
};
  
add('lol')