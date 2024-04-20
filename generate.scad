use <../PolyGear.scad>
use <../shortcuts.scad>
use <../PolyGearBasics.scad>

/* [Global] */
gear_type = "bevel"; // [bevel, spur]
// Number of teeth
num_teeth = 16; // [7:1:2000]
// Module
mod = 1; // [1:0.01:40]

/* [Spur] */
// Pressure angle
spur_pressure_angle = 20; // [5:0.001:40]
// Helix angle
spur_helix_angle = 0; // [0:0.001:30]
// Backlash
spur_backlash = 0.1; // [0:0.001:1]
// Gear width
spur_gear_width = 5; // [1:0.001:1000]
// Tolerences
spur_tol = 0.0; // [0:0.001:1]
// Chamfer
spur_chamfer = 0.0; // [0:0.1:89]
// Chamfer shift -- no idea what it does
spur_chamfer_shift = 1.0;
// add to addendum
spur_add = 0;
// subtract to the dedendum
spur_ded = 0;
// profile shift
spur_profile_shift = 0; // [0:0.001:1]
// type
spur_type=1; //  [-1:type2, 1:type1]
// Tooth profile subdivision
spur_face_num = 100;
spur_thickness = 0;



/* [Bevel] */
cone_angle = 45;
// Teeth width
teeth_width = 1.0; // [0:0.001:100]
// Pressure angle
bevel_pressure_angle = 20; // [5:0.001:40]
// Helix angle
bevel_helix_angle = 0; // [0:0.001:30]
// Backlash
bevel_backlash = 0.1; // [0:0.001:1]
// Gear width
bevel_gear_width = 5; // [1:0.001:1000]
// Tolerences
bevel_tol = 0.0; // [0:0.001:1]
// Chamfer
bevel_chamfer = 0.0; // [0:0.1:89]
// Chamfer shift -- no idea what it does
bevel_chamfer_shift = 1.0;
// add to addendum
bevel_add = 0;
// subtract to the dedendum
bevel_ded = 0;
// profile shift
bevel_profile_shift = 0; // [0:0.001:1]
// type
bevel_type=1; //  [-1:type2, 1:type1]
// Tooth profile subdivision
bevel_face_num = 100;
bevel_thickness = 0;




if (gear_type == "spur") {
	spur_gear(n = num_teeth, m = mod, z = spur_thickness, pressure_angle = spur_pressure_angle, helix_angle = spur_helix_angle, backlash = spur_backlash, w = spur_gear_width, tol = spur_tol, chamfer = spur_chamfer, chamfer_shift = spur_chamfer_shift, add = spur_add, ded = spur_ded, x = spur_profile_shift, type = spur_type, $fn = spur_face_num);
} else if (gear_type == "bevel") {
	bevel_gear(n = num_teeth, m = mod, w = teeth_width, cone_angle = cone_angle, pressure_angle = bevel_pressure_angle, helix_angle = bevel_helix_angle, backlash = bevel_backlash, z = undef, a0 = undef, b0 = undef, tol = bevel_tol, add = bevel_add, ded = bevel_ded, x = bevel_profile_shift, type = bevel_type);
} else {
	assert(false);
}