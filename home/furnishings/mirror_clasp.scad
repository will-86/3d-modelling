plateWidth = 30;
hookWidth = 3;
gapWidth = 20;
buttressHeight = 5;
wedgeWidth = 10;

cube ([plateWidth, plateWidth, hookWidth]);

translate ([plateWidth, (plateWidth - (gapWidth + (2 * hookWidth))) / 2, 0]) {
    difference () {
        cube ([gapWidth + hookWidth, gapWidth + (2 * hookWidth), hookWidth]);

        translate ([0, hookWidth, -hookWidth]) {
            cube ([gapWidth, gapWidth, hookWidth * 2]);
        }
    }
}

translate ([plateWidth + gapWidth + hookWidth, (plateWidth - (gapWidth + (2 * hookWidth))) / 2, 0]) {
    linear_extrude(height=wedgeWidth, center=false, convexity=100, twist=0) {
        rotate ([90,0,0]) {
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