piWidth = 16;
piLength = 65;

baseDepth = 2;
wallDepth = 2;

spacing = 10;

backPlateHeight = 20;

module base_plate()
{
    cube([(3 * (piWidth + (2 * wallDepth)) + (2 * spacing)), piLength, baseDepth]);
}

module slot()
{
    cube([wallDepth, piLength, baseDepth + backPlateHeight]);

    translate([wallDepth + piWidth, 0, 0 ])
    {
        cube([wallDepth, piLength, baseDepth + 6]);

        translate([0, piLength - 22, 0]) {
            cube([wallDepth, 22, baseDepth + backPlateHeight]);
        }
    }
}

base_plate();
slot();

translate([ piWidth + spacing + (2 * wallDepth), 0, 0 ])
{
    slot();
}

translate([ 2 * (piWidth + spacing + (2 * wallDepth)), 0, 0 ])
{
    slot();
}
