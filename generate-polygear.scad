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
pressure_angle_ps = 20; // [5:0.001:40]
// Helix angle
helix_angle_ps = 0; // [0:0.001:30]
// Backlash
backlash_ps = 0.1; // [0:0.001:1]
// Gear width
gear_width_ps = 5; // [1:0.001:1000]
// Tolerences
tol_ps = 0.0; // [0:0.001:1]
// Chamfer
chamfer_ps = 0.0; // [0:0.1:89]
// Chamfer shift -- no idea what it does
chamfer_shift_ps = 1.0;
// add to addendum
add_ps = 0;
// subtract to the dedendum
ded_ps = 0;
// profile shift
profile_shift_ps = 0; // [0:0.001:1]
// type
type_ps=1; //  [-1:type2, 1:type1]
// Tooth profile subdivision
face_num_ps = 100;
// tooth thickness
thickness_ps = 0;


/* [PolyGear Bevel] */
cone_angle = 45;
// Teeth width
teeth_width = 1.0; // [0:0.001:100]
// Pressure angle
pressure_angle_pb = 20; // [5:0.001:40]
// Helix angle
helix_angle_pb = 0; // [0:0.001:30]
// Backlash
backlash_pb = 0.1; // [0:0.001:1]
// Gear width
gear_width_pb = 5; // [1:0.001:1000]
// Tolerences
tol_pb = 0.0; // [0:0.001:1]
// Chamfer
chamfer_pb = 0.0; // [0:0.1:89]
// Chamfer shift -- no idea what it does
chamfer_shift_pb = 1.0;
// add to addendum
add_pb = 0;
// subtract to the dedendum
ded_pb = 0;
// profile shift
profile_shift_pb = 0; // [0:0.001:1]
// type
typ_pbe=1; //  [-1:type2, 1:type1]
// Tooth profile subdivision
face_num_pb = 100;
// tooth thickness
thickness_pb = 0;

/* [PolyGear Planetary] */

ring_teeth_pp = 41;
sun_teeth_pp = 15;
num_planets_pp = 3;
thickness_pp = 10;
backlash_pp = 0.1; // [0:0.0001:2]
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
tol_pp = 0.0; // [0:0.001:1]
planet_bore_pp = 1.0; // [0:0.01:200]
sun_bore_pp = 1.0; // [0:0.01:200]
enable_ring_pp = true;
enable_sun_pp = true;
enable_planet_pp = true;




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

	// Cutting the ring gear, note that the backlash (which defaults to 0.1) here is negative.
	// Addendum and dedendum are also given to add some clearance
	if (enable_ring_pp) {
		D() {
		  Cy(h=thickness_pp, d=ring_teeth+10, $fn = $fn);
		  spur_gear(n=ring_teeth, z=thickness_pp + 1, backlash = -backlash_pp, helix_angle = helix_angle_pp, pressure_angle = pressure_angle_pp, chamfer = chamfer_pp, add = add_pp + 0.1, ded = ded_pp -0.2, tol = tol_pp);  
		}
	}

	// Here comes the sun
	if (enable_sun_pp) {
		Rz(180/sun_teeth*((planet_teeth+1)%2)) 
			difference() {
				spur_gear(n=sun_teeth, z=thickness_pp, backlash = backlash_pp, helix_angle = helix_angle_pp, pressure_angle = pressure_angle_pp, chamfer = chamfer_pp, add = add_pp, ded = ded_pp, tol = tol_pp);
				cylinder(h = 200, d = sun_bore_pp, center = true, $fn = bore_face_num);
			}
	}
	if (enable_planet_pp) {
		// Now doing the planets
		// To properly place the planets without tooth interference, theta is computed.
		// It may slightly deviate from planet_angle depending on the numeber of teeth and planets.
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
				spur_gear(n = num_teeth, m = mod, z = thickness_ps, pressure_angle = pressure_angle_ps, helix_angle = helix_angle_ps, backlash = backlash_ps, w = gear_width_ps, tol = tol_ps, chamfer = chamfer_ps, chamfer_shift = chamfer_shift_ps, add = add_ps, ded = ded_ps, x = profile_shift_ps, type = type_ps, $fn = face_num_ps);
			} else if (gear_type == "polybevel") {
				bevel_gear(n = num_teeth, m = mod, w = teeth_width, cone_angle = cone_angle, pressure_angle = pressure_angl_pbe, helix_angle = helix_angl_pbe, backlash = backlas_pbh, z = undef, a0 = undef, b0 = undef, tol = to_pbl, add = ad_pbd, ded = de_pbd, x = profile_shif_pbt, type = typ_pbe);
			} else {
				assert(false);
			}
		}
		cylinder(h = 200, d = bore, center = true, $fn = bore_face_num);
	}
}
