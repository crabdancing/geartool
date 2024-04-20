use <deps/gears/gears.scad>

/* [Global] */
gear_type = "spur"; // [bevel, spur, worm, spiral_bevel]
// Number of teeth
num_teeth = 16; // [7:1:2000]
// Module
mod = 1; // [0.1:0.01:40]
// Bore
bore = 8; // [0:0.01:200]
// Pressure angle
pressure_angle = 20; // [5:0.001:40]
// Helix angle
helix_angle = 0; // [0:0.001:30]
// Face number
$fn = 100; // [0:1:500]

/* [Spur] */
gear_width = 1;
// Backlash
// polyspur_backlash = 0.1; // [0:0.001:1]
// // Gear width
// polyspur_gear_width = 5; // [1:0.001:1000]
// // Tolerences
// polyspur_tol = 0.0; // [0:0.001:1]
// // Chamfer
// polyspur_chamfer = 0.0; // [0:0.1:89]
// // Chamfer shift -- no idea what it does
// polyspur_chamfer_shift = 1.0;
// // add to addendum
// polyspur_add = 0;
// // subtract to the dedendum
// polyspur_ded = 0;
// // profile shift
// polyspur_profile_shift = 0; // [0:0.001:1]
// // type
// polyspur_type=1; //  [-1:type2, 1:type1]
// // Tooth profile subdivision
// polyspur_face_num = 100;
// // tooth thickness
// polyspur_thickness = 0;


/* [Bevel] */
// Teeth width
tooth_width = 1.0; // [0:0.001:100]
cone_angle = 45;
// // Pressure angle
// polybevel_pressure_angle = 20; // [5:0.001:40]
// // Helix angle
// polybevel_helix_angle = 0; // [0:0.001:30]
// // Backlash
// polybevel_backlash = 0.1; // [0:0.001:1]
// // Gear width
// polybevel_gear_width = 5; // [1:0.001:1000]
// // Tolerences
// polybevel_tol = 0.0; // [0:0.001:1]
// // Chamfer
// polybevel_chamfer = 0.0; // [0:0.1:89]
// // Chamfer shift -- no idea what it does
// polybevel_chamfer_shift = 1.0;
// // add to addendum
// polybevel_add = 0;
// // subtract to the dedendum
// polybevel_ded = 0;
// // profile shift
// polybevel_profile_shift = 0; // [0:0.001:1]
// // type
// polybevel_type=1; //  [-1:type2, 1:type1]
// // Tooth profile subdivision
// polybevel_face_num = 100;
// // tooth thickness
// polybevel_thickness = 0;

/* [Worm] */
show_spur = true;
show_worm = true;
worm_length = 10; // [1:0.01:500]
thread_starts = 1; // [1:1:100]
worm_tooth_width = 5.0; // [0:0.001:100]
// Spur bore
spur_bore = 8; // [0:0.01:200]
//Lead angle
lead_angle = 5; // [0.5:0.01:5]

/* [Spiral Bevel] */
partial_cone_angle = 0; 
spiral_bevel_tooth_width = 0;

if (gear_type == "spur") {
	spur_gear(modul = mod, tooth_number = num_teeth, width = gear_width, bore = bore, pressure_angle = pressure_angle, helix_angle = helix_angle, optimized = true, $fn = $fn);
} else if (gear_type == "bevel") {
	bevel_gear(modul = mod, tooth_number = num_teeth, partial_cone_angle = cone_angle, tooth_width = tooth_width, bore = bore, pressure_angle = pressure_angle, helix_angle = helix_angle, $fn = $fn);
} else if (gear_type == "worm") {
	worm_gear(modul = mod, tooth_number = num_teeth, thread_starts = thread_starts, width = worm_tooth_width, length = worm_length, worm_bore = bore, gear_bore = spur_bore, pressure_angle = pressure_angle, lead_angle = lead_angle, optimized = true, together_built = true, show_spur = show_spur, show_worm = show_worm);
} else if (gear_type == "spiral_bevel") {
	spiral_bevel_gear(modul = mod, tooth_number = num_teeth, partial_cone_angle = partial_cone_angle, tooth_width = spiral_bevel_tooth_width, bore = bore, pressure_angle = pressure_angle, helix_angle = helix_angle);
} else {
	assert(false);
}