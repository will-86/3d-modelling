cube([10, 10, 50]);

translate([2.5, -5, 0]) {
  difference() {
    cube([5, 5, 25]);

    translate([0, 2, 0]) {
      cube([1.5, 3, 25]);
    }

    translate([3.5, 2, 0]) {
      cube([1.5, 3, 25]);
    }
  }
}

translate([20, 0, 0]) {
  difference() {
    cube([20, 10, 30]);

    translate([9, 0, 0]) {
      cube([2, 3, 25]);
    }

    translate([7.5, 3, 0]) {
      cube([5, 2, 25]);
    }
  }
}

translate([60, 0, 0]) {
  linear_extrude(height = 25, center = false, convexity = 10, twist = 0, $fn = 100) {
    polygon(points = [[0,0], [5,0], [0,5]], paths = [0,1,2]);
  }
}
