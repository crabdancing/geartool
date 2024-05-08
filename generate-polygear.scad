use <deps/PolyGear/PolyGear.scad>
use <deps/PolyGear/shortcuts.scad>
use <deps/PolyGear/PolyGearBasics.scad>

/* [Global] */
$fn = 200; // [10:1:200]
gear_type = "polybevel"; // [polybevel, polyspur, poly_planetary]
// Number of teeth
num_teeth = 16; // [7:1:2000]
// Module
mod = 1; // [1:0.01:40]
bore = 0; // [0:0.01:200]
bore_face_num = 100; // [10:1:500]

/* [PolyGear Spur] */
// Pressure angle
polyspur_pressure_angle = 20; // [5:0.001:40]
// Helix angle
polyspur_helix_angle = 0; // [0:0.001:30]
// Gear width
polyspur_gear_width = 5; // [1:0.001:1000]
// Tolerences
polyspur_tol = 0.0; // [-1:0.001:1]
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
// tooth thickness
polyspur_thickness = 0;


/* [PolyGear Bevel] */
cone_angle = 45;
// Teeth width
teeth_width = 1.0; // [0:0.001:100]
// Pressure angle
polybevel_pressure_angle = 20; // [5:0.001:40]
// Helix angle
polybevel_helix_angle = 0; // [0:0.001:30]
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
// tooth thickness
polybevel_thickness = 0;

/* [PolyGear Planetary] */

ring_teeth_pp = 41;
sun_teeth_pp = 15;
num_planets_pp = 3;
thickness_pp = 10;
helix_angle_pp = 0; // [0:0.01:45]
pressure_angle_pp = 20; // [5:0.001:40]
chamfer_pp = 0.0; // [0:0.1:89]
// add to addendum
add_pp = 0.1;
// subtract to the dedendum
ded_pp = 0.2;
// profile shift
profile_shift_pp = 0; // [0:0.001:1]
// Tolerence
tol_pp = 0.0; // [-1:0.001:1]
planet_bore_pp = 1.0; // [0:0.01:200]
sun_bore_pp = 1.0; // [0:0.01:200]
enable_ring_pp = true;
enable_sun_pp = true;
enable_planet_pp = true;
together_pp = true;




if (gear_type == "poly_planetary") {
	//////

	ring_teeth = ring_teeth_pp;
	sun_teeth = sun_teeth_pp;
	n_planets = num_planets_pp;

	//////

	planet_teeth = (ring_teeth - sun_teeth)/2;
	assert(planet_teeth == round(planet_teeth), 
	       "ring_teeth and sun_teeth have to be both even or both odd");
	planet_angle = 360/n_planets;

	//////
	ring_diameter = ring_teeth + 10;

	// Cutting the ring gear, note that the backlash (which defaults to 0.1) here is negative.
	// Addendum and dedendum are also given to add some clearance
	if (enable_ring_pp) {
		translate([together_pp ? 0 : ring_diameter * 1.1, 0, 0])
		D() {
		  Cy(h=thickness_pp, d = ring_diameter, $fn = $fn);
		  spur_gear(n=ring_teeth, z=thickness_pp + 1, helix_angle = helix_angle_pp, pressure_angle = pressure_angle_pp, chamfer = chamfer_pp, add = add_pp + 0.1, ded = ded_pp -0.2, tol = -tol_pp);  
		}
	}

	// Here comes the sun
	if (enable_sun_pp) {
		Rz(180/sun_teeth*((planet_teeth+1)%2)) 
			difference() {
				spur_gear(n=sun_teeth, z=thickness_pp, helix_angle = -helix_angle_pp, pressure_angle = pressure_angle_pp, chamfer = chamfer_pp, add = add_pp, ded = ded_pp, tol = tol_pp);
				cylinder(h = 200, d = sun_bore_pp, center = true, $fn = bore_face_num);
			}
	}
	if (enable_planet_pp) {
		// Now doing the planets
		// To properly place the planets without tooth interference, theta is computed.
		// It may slightly deviate from planet_angle depending on the numeber of teeth and planets.
		n_planets = together_pp ? n_planets : 1;
		translate([together_pp ? 0 : -ring_diameter, 0, 0])
		for (i=[0:n_planets-1]) 
		  let(theta = round(i*planet_angle*(ring_teeth+sun_teeth)/360)*
		              360/(ring_teeth+sun_teeth))
		  echo(str("Planet ",i+1," angle = ", theta))
		  Rz(theta)
		  Tx((sun_teeth+planet_teeth)/2) 
		  Rz(theta*sun_teeth/planet_teeth)

			difference() {
			  spur_gear(n=planet_teeth, z=thickness_pp, helix_angle = helix_angle_pp, pressure_angle = pressure_angle_pp, chamfer = chamfer_pp, add = add_pp, ded = ded_pp, tol = tol_pp);
				cylinder(h = 200, d = planet_bore_pp, center = true, $fn = bore_face_num);
			}
	}
	
} else {
	difference() {
		union() {
			if (gear_type == "polyspur") {
				spur_gear(n = num_teeth, m = mod, z = polyspur_thickness, pressure_angle = polyspur_pressure_angle, helix_angle = polyspur_helix_angle, w = polyspur_gear_width, tol = polyspur_tol, chamfer = polyspur_chamfer, chamfer_shift = polyspur_chamfer_shift, add = polyspur_add, ded = polyspur_ded, x = polyspur_profile_shift, type = polyspur_type, $fn = polyspur_face_num);
			} else if (gear_type == "polybevel") {
				bevel_gear(n = num_teeth, m = mod, w = teeth_width, cone_angle = cone_angle, pressure_angle = polybevel_pressure_angle, helix_angle = polybevel_helix_angle, z = undef, a0 = undef, b0 = undef, tol = polybevel_tol, add = polybevel_add, ded = polybevel_ded, x = polybevel_profile_shift, type = polybevel_type);
			} else {
				assert(false);
			}
		}
		cylinder(h = 200, d = bore, center = true, $fn = bore_face_num);
	}
}
