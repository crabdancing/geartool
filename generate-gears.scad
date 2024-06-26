use <deps/gears/gears.scad>

/* [Global] */
gear_type = "spur"; // [bevel, spur, worm, spiral_bevel, planetary]
mod = 1; // [0.1:0.01:40]
bore = 8; // [0:0.01:200]
pressure_angle = 20; // [5:0.001:40]
helix_angle = 0; // [0:0.001:30]
$fn = 100; // [0:1:500]

/* [Spur] */
spur_num_tooth = 16; // [7:1:2000]
spur_gear_width = 1;

/* [Bevel] */
bevel_num_tooth = 16; // [7:1:2000]
bevel_tooth_width = 1.0; // [0:0.001:100]
bevel_cone_angle = 45;

/* [Worm] */
// Number of gear teeth
worm_num_tooth = 16; // [7:1:2000]
show_spur = true;
show_worm = true;
worm_length = 10; // [1:0.01:500]
thread_starts = 1; // [1:1:100]
worm_tooth_width = 5.0; // [0:0.001:100]
spur_bore = 8; // [0:0.01:200]
lead_angle = 5; // [0.5:0.01:5]

/* [Spiral Bevel] */
// Number of gear teeth
spiral_bevel_num_tooth = 16; // [7:1:2000]
spiral_bevel_partial_cone_angle = 10; 
spiral_bevel_tooth_width = 10;

/* [Planetary] */
planet_bore__p = 1.0; // [0:0.01:200]
sun_bore__p = 1.0; // [0:0.01:200]
num_sun_tooth__p = 15; // [7:1:2000]
num_planet_tooth__p = 14; // [7:1:2000]
num_planets__p = 3; // [2:1:20]
rim_width__p = 10; // [0:0.01:100]
gear_width__p = 10; // [0.5:0.01:100]
together_built = true;
use_ring__p = true; 
use_sun__p = true; 
use_planet__p = true; 

if (gear_type == "spur") {
	spur_gear(modul = mod, tooth_number = spur_num_tooth, width = spur_gear_width, bore = bore, pressure_angle = pressure_angle, helix_angle = helix_angle, optimized = true, $fn = $fn);
} else if (gear_type == "bevel") {
	bevel_gear(modul = mod, tooth_number = bevel_num_tooth, partial_cone_angle = bevel_cone_angle, tooth_width = bevel_tooth_width, bore = bore, pressure_angle = pressure_angle, helix_angle = helix_angle, $fn = $fn);
} else if (gear_type == "worm") {
	worm_gear(modul = mod, tooth_number = worm_num_tooth, thread_starts = thread_starts, width = worm_tooth_width, length = worm_length, worm_bore = bore, gear_bore = spur_bore, pressure_angle = pressure_angle, lead_angle = lead_angle, optimized = true, together_built = true, show_spur = show_spur, show_worm = show_worm);
} else if (gear_type == "spiral_bevel") {
	spiral_bevel_gear(modul = mod, tooth_number = spiral_bevel_num_tooth, partial_cone_angle = spiral_bevel_partial_cone_angle, tooth_width = spiral_bevel_tooth_width, bore = bore, pressure_angle = pressure_angle, helix_angle = helix_angle);
} else if (gear_type == "planetary") {
	planetary_gear(modul = mod, sun_teeth = num_sun_tooth__p, planet_teeth = num_planet_tooth__p, number_planets = num_planets__p, width = gear_width__p, rim_width = rim_width__p, planet_bore = planet_bore__p, sun_bore = sun_bore__p, pressure_angle = pressure_angle, helix_angle = helix_angle, together_built = together_built, optimized=true, $fn = $fn, use_planet = use_planet__p, use_sun = use_sun__p, use_ring = use_ring__p);
} else {
	assert(false);
}