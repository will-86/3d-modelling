$fa = 0.4;
$fs = 1;

// Pico Enviro+ Dimensions
enviroWidth = 31.8;
enviroHeight = 61.8;
enviroDepth = 1.8;
pmsWidth = 15;
pmsDepth = 3.6;
qwkWidth = 6.2;
qwkDepth = 2.8;
offsetTop = 6;
offsetBottom = 1.6;

// Pico Dimensions
picoWidth = 21.2;
picoHeight = 51.2;
picoDepth = 1;
usbWidth = 11;
usbDepth = 4.2;
pinDepth = 8.4;

// Overall Dimensions
maxWidth = 32;
maxHeight = 62;
maxDepth = 20;

// Nouveau
strutWidth = 5;
strutHeight = 55;
strutDepth = 10;
baseDepth = 2;

module strut() {
  cube ([strutWidth, strutHeight, strutDepth]);
}

render () {
  strut();

  translate ([picoWidth + strutWidth, 0, 0]) {
    strut();
  }

  difference () {
    cube ([picoWidth + (2 * strutWidth), strutWidth, strutDepth]);

    translate([strutWidth + ((picoWidth - pmsWidth) / 2), 0, 0]) {
      cube ([pmsWidth, strutWidth, strutWidth]);
    }
  }

  translate ([picoWidth + (2 * strutWidth), 0, 2 * strutDepth]) {
    rotate ([180, 90, 0]) {
      rotate_extrude (angle = 15) {
        square ([2 * strutDepth, picoWidth + (2 * strutWidth)]);
      }
    }
  }
}
