// Set variables for dimensions
camera_width = 30;
camera_depth = 30;
table_height = 38;
support_depth = 30;
support_width = 30;
support_thickness_bottom = 3;
support_thickness_top = 3;
camera_platform_thickness = 3;
bracket_height = 190;
bracket_depth = 30;
bracket_thickess = 3;

// Table Bracket
cube ([support_width + bracket_thickess, support_depth, support_thickness_bottom]);
cube ([bracket_thickess, bracket_depth, support_thickness_bottom + table_height + bracket_height + camera_platform_thickness]);

translate ([0, 0, support_thickness_bottom + table_height]) {
    cube ([support_width + bracket_thickess, support_depth, support_thickness_top]);
}

translate ([0,0, support_thickness_bottom + table_height + bracket_height]) {
    cube ([camera_width + bracket_thickess, camera_depth, camera_platform_thickness]);
}
