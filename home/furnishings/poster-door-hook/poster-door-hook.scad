pic_hook_gap = 18;
pic_hook_height = 8;
pic_hook_depth = 2;
pic_frame_depth = 4;
door_thick = 43;
hook_thick = 5;
door_drop = 115;
hook_drop = 105;

cube([ door_drop + hook_thick, hook_thick, pic_hook_gap ]);
cube([ hook_thick, door_thick + (2 * hook_thick), pic_hook_gap ]);

translate([ 0, door_thick + hook_thick, 0 ])
{
    cube([ door_drop + (2 * hook_thick) + hook_drop + pic_hook_height, hook_thick, pic_hook_gap ]);
}

translate([ door_drop + hook_thick + hook_drop + pic_hook_height, door_thick + (2 * hook_thick), 0 ])
{
    cube([ hook_thick, pic_frame_depth + hook_thick, pic_hook_gap ]);
}

translate([ door_drop + hook_thick + hook_drop + pic_hook_height - pic_hook_depth, door_thick + (3 * hook_thick) + pic_frame_depth - pic_hook_depth, 0]) {
  cube([ pic_hook_depth, pic_hook_depth, pic_hook_gap]);
}
