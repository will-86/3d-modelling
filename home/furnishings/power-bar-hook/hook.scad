// Render Controls
$fa = 1;
$fs = 0.4;

// Dimensions
hookWidth = 40;
baseHeight = 45;
hookDepth = 5;
hangerLength = 20;
hookLength = 60;
hangerGap = 3.4;

// Model
render () {
  cube ([hookWidth, hookDepth, hookDepth + hangerLength]);

  translate ([0, hookDepth, 0]) {
    cube ([hookWidth, baseHeight + hookDepth, hookDepth]);

    translate ([0, baseHeight + hookDepth, 0]) {
      cube ([hookWidth, hookDepth, hookLength + (2 * hookDepth)]);

      translate ([0, 0, hookLength + hookDepth]) {
        cube ([hookWidth, hangerGap + (2 * hookDepth), hookDepth]);

        translate ([0, hangerGap + hookDepth, -hangerLength]) {
          cube([hookWidth, hookDepth, hookDepth + hangerLength]);
        }
      }
    }
  }
}
