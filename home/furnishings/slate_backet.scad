slateWidth = 300;
slateHeight = 120;
slateDepth = 6;
slateEdge = 6;

module chamfer(length) {
  translate([0, 0, slateEdge]) {
    rotate([0, 90, 0]) {
      linear_extrude(height=length, center=false, convexity=10, twist=0) {
        polygon(points=[[0,0],[slateEdge,0],[0,slateEdge]], paths=[[0,1,2]]);
      }
    }
  }
}

difference() {
  cube([slateWidth, slateHeight, slateDepth]);

  chamfer(slateWidth);
}
