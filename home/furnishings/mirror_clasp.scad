plateWidth = 40;
hookWidth = 3;
gapWidth = 20;
buttressHeight = 5;
wedgeWidth = 10;

cube ([plateWidth, plateWidth, hookWidth]);

translate ([plateWidth - hookWidth, (plateWidth - (gapWidth + (2 * hookWidth))) / 2, 0]) {
    difference () {
        cube ([gapWidth + (2 * hookWidth), gapWidth + (2 * hookWidth), hookWidth]);

        translate ([hookWidth, hookWidth, -hookWidth]) {
            cube ([gapWidth, gapWidth, hookWidth * 2]);
        }
    }

    translate ([0, hookWidth, 0]) {
        rotate([90,0,0]) {
            linear_extrude(height=hookWidth) {
                polygon(points=[
                    [0,0],
                    [hookWidth / 2, 2 * hookWidth],
                    [gapWidth + (3 * hookWidth / 2), 2 * hookWidth],
                    [gapWidth + (5 * hookWidth / 2), 0]
                ], paths=[
                    [0,1,2,3]
                ]);
            }
        }
    }

    translate ([0, (2 * hookWidth) + gapWidth, 0]) {
        rotate([90,0,0]) {
            linear_extrude(height=hookWidth) {
                polygon(points=[
                    [0,0],
                    [hookWidth / 2, 2 * hookWidth],
                    [gapWidth + (3 * hookWidth / 2), 2 * hookWidth],
                    [gapWidth + (5 * hookWidth / 2), 0]
                ], paths=[
                    [0,1,2,3]
                ]);
            }
        }
    }
}

translate ([plateWidth + gapWidth, (plateWidth + gapWidth)/2, 0]) {
    rotate ([90,0,0]) {
        linear_extrude(height=gapWidth) {
            polygon(points=[
                [0,0],
                [0,wedgeWidth],
                [wedgeWidth, 0]
            ], paths=[
                [0, 1, 2]
            ]);
        }
    }
}

translate ([plateWidth, (plateWidth + gapWidth)/2, 0]) {
    rotate([90,0,0]) {
        linear_extrude(height=gapWidth) {
            polygon(points=[
                [0,0],
                [0,wedgeWidth],
                [-wedgeWidth,0]
            ], paths=[
                [0,1,2]
            ]);
        }
    }
}
