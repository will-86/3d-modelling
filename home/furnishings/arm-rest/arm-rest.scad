armWidth = 175;
armLength = 240;
lipHeight = 0;
lipWidth = 0;
supportHeight = 33;
supportWidth = 5;
plateHeight = 3;

cube([armWidth, armLength, plateHeight]);

module support () {
    cube([supportWidth, armLength, plateHeight + supportHeight]);
}

support();

translate ([armWidth - supportWidth, 0, 0]) {
    support();
}

translate ([0, 0, -lipHeight]) {
    cube([armWidth, lipWidth, plateHeight + lipHeight]);
    cube([lipWidth, armLength, plateHeight + lipHeight]);
}

translate([0, armLength - lipWidth, -lipHeight]) {
    cube([armWidth, lipWidth, plateHeight + lipHeight]);
}

translate([armWidth - lipWidth, 0, -lipHeight]) {
    cube([lipWidth, armLength, plateHeight + lipHeight]);
}
