$fa = 0.1;
$fn = 100;

outer = 9.8;
inner = 5.1;
height = 5;

difference() {
  cylinder(height, d=outer);

  cylinder(height, d=inner);
}
