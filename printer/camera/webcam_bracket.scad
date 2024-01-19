// Set variables for dimensions
camera_width = 30;
camera_depth = 30;
table_height = 37.9;
support_depth = 30;
support_width = 30;
support_thickness_bottom = 10;
support_thickness_top = 10;
camera_platform_thickness = 10;
bracket_height = 90;
bracket_depth = 30;
bracket_thickess = 5;

// Table Bracket
cube ([support_width + bracket_thickess, support_depth, support_thickness_bottom]);
cube ([bracket_thickess, bracket_depth, support_thickness_bottom + table_height + bracket_height + camera_platform_thickness]);

translate ([0, 0, support_thickness_bottom + table_height]) {
    cube ([support_width + bracket_thickess, support_depth, support_thickness_top]);
}

translate ([0,0, support_thickness_bottom + table_height + bracket_height]) {
    cube ([camera_width + bracket_thickess, camera_depth, camera_platform_thickness]);
}
