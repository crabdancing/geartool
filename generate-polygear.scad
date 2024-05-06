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

poly_planetary_ring_teeth = 41;
poly_planetary_sun_teeth = 15;
poly_planetary_num_planets = 3;
poly_planetary_thickness = 10;
poly_planetary_backlash = 0.1; // [0:0.0001:2]
poly_planetary_helix_angle = 0; // [0:0.01:45]
poly_planetary_pressure_angle = 20; // [5:0.001:40]
poly_planetary_chamfer = 0.0; // [0:0.1:89]
// add to addendum
poly_planetary_add = 0.1;
// subtract to the dedendum
poly_planetary_ded = 0.2;
// profile shift
poly_planetary_profile_shift = 0; // [0:0.001:1]
// Tolerence
poly_planetary_tol = 0.0; // [0:0.001:1]
poly_planetary_planet_bore = 1.0; // [0:0.01:200]
poly_planetary_sun_bore = 1.0; // [0:0.01:200]
poly_planetary_enable_ring = true;
poly_planetary_enable_sun = true;
poly_planetary_enable_planet = true;




if (gear_type == "poly_planetary") {
	//////

	ring_teeth = poly_planetary_ring_teeth;
	sun_teeth = poly_planetary_sun_teeth;
	n_planets = poly_planetary_num_planets;

	//////

	planet_teeth = (ring_teeth - sun_teeth)/2;
	assert(planet_teeth == round(planet_teeth), 
	       "ring_teeth and sun_teeth have to be both even or both odd");
	planet_angle = 360/n_planets;

	//////

	// Cutting the ring gear, note that the backlash (which defaults to 0.1) here is negative.
	// Addendum and dedendum are also given to add some clearance
	if (poly_planetary_enable_ring) {
		D() {
		  Cy(h=poly_planetary_thickness, d=ring_teeth+10, $fn = $fn);
		  spur_gear(n=ring_teeth, z=poly_planetary_thickness + 1, backlash = -poly_planetary_backlash, helix_angle = poly_planetary_helix_angle, pressure_angle = poly_planetary_pressure_angle, chamfer = poly_planetary_chamfer, add = poly_planetary_add + 0.1, ded = poly_planetary_ded -0.2, tol = poly_planetary_tol);  
		}
	}

	// Here comes the sun
	if (poly_planetary_enable_sun) {
		Rz(180/sun_teeth*((planet_teeth+1)%2)) 
			difference() {
				spur_gear(n=sun_teeth, z=poly_planetary_thickness, backlash = poly_planetary_backlash, helix_angle = poly_planetary_helix_angle, pressure_angle = poly_planetary_pressure_angle, chamfer = poly_planetary_chamfer, add = poly_planetary_add, ded = poly_planetary_ded, tol = poly_planetary_tol);
				cylinder(h = 200, d = poly_planetary_sun_bore, center = true, $fn = bore_face_num);
			}
	}
	if (poly_planetary_enable_planet) {
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
			  spur_gear(n=planet_teeth, z=poly_planetary_thickness, helix_angle = poly_planetary_helix_angle, pressure_angle = poly_planetary_pressure_angle, chamfer = poly_planetary_chamfer, add = poly_planetary_add, ded = poly_planetary_ded, tol = poly_planetary_tol);
				cylinder(h = 200, d = poly_planetary_planet_bore, center = true, $fn = bore_face_num);
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