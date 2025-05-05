// === Parameters ===
plate_thickness = 2.8;
faceplate_width = 160;
faceplate_height = 88.9;  // 2U

rack_total_width = 250; // 10" rack
side_extension = (rack_total_width - faceplate_width) / 2;
rack_post_hole_offset = 7;

rack_flange_height = 44.45; // 1U
rack_flange_depth = 20;
rack_hole_radius = 3;
rack_hole_y = [6.35, 22.225, 38.1];

psu_width = 150;
psu_height = 86;
psu_hole_offset = 6;
psu_hole_x = [psu_hole_offset, psu_width - psu_hole_offset];
psu_hole_y = [psu_hole_offset, psu_height - psu_hole_offset];
psu_hole_radius = 2;

faceplate_padding_x = (faceplate_width - psu_width) / 2;
faceplate_padding_y = (faceplate_height - psu_height) / 2;

// === Modules ===

// Rack flange with mounting holes
module rack_flange(side = "left") {
    x_pos = (side == "left") ? -side_extension : faceplate_width;
    y_pos = faceplate_height - rack_flange_height;
    x_offset = (side == "left") ? rack_post_hole_offset : side_extension - rack_post_hole_offset;

    translate([x_pos, y_pos, 0])
    difference() {
        cube([side_extension, rack_flange_height, plate_thickness]);
        for (y = rack_hole_y)
            translate([x_offset, y, -1])
                cylinder(h = plate_thickness + 2, r = rack_hole_radius, $fn = 24);
    }
}

// Main PSU face bracket with open center
module psu_face_bracket_frame() {
    outer_w = faceplate_width;
    outer_h = faceplate_height;

    frame_border = 8;

    inner_w = psu_width - frame_border * 2;
    inner_h = psu_height - frame_border * 2;

    inner_x = faceplate_padding_x + frame_border;
    inner_y = faceplate_padding_y + frame_border;

    difference() {
        // Full front plate
        cube([outer_w, outer_h, plate_thickness]);

        // Large central cutout
        translate([inner_x, inner_y, -1])
            cube([inner_w, inner_h, plate_thickness + 2]);

        // PSU mounting holes
        for (x = psu_hole_x)
            for (y = psu_hole_y)
                translate([faceplate_padding_x + x, faceplate_padding_y + y, -1])
                    cylinder(h = plate_thickness + 2, r = psu_hole_radius, $fn = 24);
    }

    // Rack flanges & gussets
    rack_flange("left");
    rack_flange("right");
}

// === Run it ===
psu_face_bracket_frame();
