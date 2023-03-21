// // Badger Dimensions
// badger_width = 85.6;
// badger_height = 48.7;
// badger_depth = 2.5;

// // Card Dimensions
// card_width = 85.6;
// card_height = 54;
// card_depth = 1;

// // Battery Dimensions
// batt_width = 64;
// batt_height = 35.5;
// batt_depth = 5.3;

// // Card Holder

// color("red") {
//     // Bottom retainer
//     cube([2 + card_width + 2, 2 + 2, 1]);
//     cube([2 + card_width + 2, 2, 3]);
    
//     // Top retainer
//     translate([0, card_height, 0])
//         cube([2 + card_width + 2, 2 + 2, 1]);
//     translate([0, 2 + card_height, 0])
//         cube([2 + card_width + 2, 2, 3]);

//     // Side retainer
//     cube([2 + 2, 2 + card_height + 2, 1]);
//     cube([2, 2 + card_height + 2, 3]);

//     // Back plate
//     translate([0, 0, 2])
//         cube([2 + card_width + 2, 2 + card_height + 2, 1]);
// }

translate([0, 0, 10])
    import("badgerV7.stl", convexity=10);

// translate([])
