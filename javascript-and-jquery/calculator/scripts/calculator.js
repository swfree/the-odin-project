var text1 = 0;
var text2 = 0;
var clicks = 0;
var operator = '';
var operation = '';

function add(a, b) {
  return a + b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

function subtract(a, b) {
  return a - b;
}

$(".num").click(function() {
  if (clicks == 0){
    text1 = +$(this).text();
  } else {
    text2 = +$(this).text();
  }
  ++clicks;
});

$(".operator").click(function() {
  operator = $(this).text();
});


$("#equals").click(function() {
  switch(operator) {
    case '/':
      operation = divide(text1, text2);
      break;
    case 'x':
      operation = multiply(text1, text2);
      break;
    case '-':
      operation = subtract(text1, text2);
      break;
    case '+':
      operation = add(text1, text2);
      break;
  }
  $(".answer").text(operation);
  text1 = 0;
  text2 = 0;
  clicks = 0;
});