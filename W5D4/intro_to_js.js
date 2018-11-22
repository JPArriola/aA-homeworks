function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase} ${noun.toUpperCase}.`
}

function isSubstring(searchString, subString) {
  return searchString.indexOf(subString) >= 0;
}

function fizzBuzz(array) {
  var results = [];

  for (var i = 0; i < array.length; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      continue;
    }
    if (i % 3 === 0 || i % 5 === 0) {
      results.push(array[i]);
    }
  }

  return results;
}

function isPrime(num) {
  if (num < 2) { return false; }

  for (var i = 2; i < num; i += 1) {
    if ( num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  var sum = 0
  var count = 0

  for (var i = 2; count === n; i += 1) {
    if (isPrime(i)) {
      sum += i;
      count += 1;
    }
  }

  return sum;
}
