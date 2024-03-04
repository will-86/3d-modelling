// Render Control
$fa = 1;
$fs = 0.4;

// Dimensions
width = 40;
height = 87;
depth_plate = 2;
depth_front = 5.2;
depth_rear = 71;
overhang_rear = 31;
overhang_front = 10;

// Modules
module base() {
  cube ([width, height + (2 * depth_plate), depth_plate]);
}

module front() {
  cube ([width, depth_plate, depth_front]);

  translate ([0, 0, depth_front]) {
    cube ([width, overhang_front, depth_plate]);
  }
}

module rear() {
  cube ([width, depth_plate, depth_rear]);

  translate ([0, -overhang_rear, depth_rear]) {
    cube ([width, overhang_rear + depth_plate, depth_plate]);
  }
}

// Model

render () {
  base ();

  front ();

  translate ([0, depth_plate + height, 0]) {
    rear ();
  }
}
