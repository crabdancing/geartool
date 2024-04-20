use <deps/PolyGear/PolyGear.scad>
use <deps/PolyGear/shortcuts.scad>
use <deps/PolyGear/PolyGearBasics.scad>

/* [Global] */
gear_type = "polybevel"; // [polybevel, polyspur]
// Number of teeth
num_teeth = 16; // [7:1:2000]
// Module
mod = 1; // [1:0.01:40]

/* [PolyGear Spur] */
// Pressure angle
polyspur_pressure_angle = 20; // [5:0.001:40]
// Helix angle
polyspur_helix_angle = 0; // [0:0.001:30]
// Backlash
polyspur_backlash = 0.1; // [0:0.001:1]
// Gear width
polyspur_gear_width = 5; // [1:0.001:1000]
// Tolerences
polyspur_tol = 0.0; // [0:0.001:1]
// Chamfer
polyspur_chamfer = 0.0; // [0:0.1:89]
// Chamfer shift -- no idea what it does
polyspur_chamfer_shift = 1.0;
// add to addendum
polyspur_add = 0;
// subtract to the dedendum
polyspur_ded = 0;
// profile shift
polyspur_profile_shift = 0; // [0:0.001:1]
// type
polyspur_type=1; //  [-1:type2, 1:type1]
// Tooth profile subdivision
polyspur_face_num = 100;
polyspur_thickness = 0;



/* [PolyGear Bevel] */
cone_angle = 45;
// Teeth width
teeth_width = 1.0; // [0:0.001:100]
// Pressure angle
polybevel_pressure_angle = 20; // [5:0.001:40]
// Helix angle
polybevel_helix_angle = 0; // [0:0.001:30]
// Backlash
polybevel_backlash = 0.1; // [0:0.001:1]
// Gear width
polybevel_gear_width = 5; // [1:0.001:1000]
// Tolerences
polybevel_tol = 0.0; // [0:0.001:1]
// Chamfer
polybevel_chamfer = 0.0; // [0:0.1:89]
// Chamfer shift -- no idea what it does
polybevel_chamfer_shift = 1.0;
// add to addendum
polybevel_add = 0;
// subtract to the dedendum
polybevel_ded = 0;
// profile shift
polybevel_profile_shift = 0; // [0:0.001:1]
// type
polybevel_type=1; //  [-1:type2, 1:type1]
// Tooth profile subdivision
polybevel_face_num = 100;
polybevel_thickness = 0;




if (gear_type == "polyspur") {
	spur_gear(n = num_teeth, m = mod, z = polyspur_thickness, pressure_angle = polyspur_pressure_angle, helix_angle = polyspur_helix_angle, backlash = polyspur_backlash, w = polyspur_gear_width, tol = polyspur_tol, chamfer = polyspur_chamfer, chamfer_shift = polyspur_chamfer_shift, add = polyspur_add, ded = polyspur_ded, x = polyspur_profile_shift, type = polyspur_type, $fn = polyspur_face_num);
} else if (gear_type == "polybevel") {
	bevel_gear(n = num_teeth, m = mod, w = teeth_width, cone_angle = cone_angle, pressure_angle = polybevel_pressure_angle, helix_angle = polybevel_helix_angle, backlash = polybevel_backlash, z = undef, a0 = undef, b0 = undef, tol = polybevel_tol, add = polybevel_add, ded = polybevel_ded, x = polybevel_profile_shift, type = polybevel_type);
} else {
	assert(false);
}