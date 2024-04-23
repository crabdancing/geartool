// Original code can be seen in `deps/toothed-pully-module-parametric`
// Includes credits for earlier versions of the code.

/* [Facets] */
$fn = 30;         // [3:60]



/* [Body] */

// Length of toothed part of Pully
Sprocket_H = 12;     // [3:.01:20]

// Shaft detent diameter
Upper_Detent_D = 6;  // [2:.01:25]

// Shaft detent height
Upper_Detent_H = .5; // [0:.01:2]

Base_Ena = true;     // Base Enable

// Pully base height, standard = 8. Set to same as Retnr_B_H if you want an Retnr_B but no Pully.
Base_H = 8;          // [3:.01:20]

// Base corner is rounded
Base_CrnrRnd = true;

// Pully base diameter
Base_D  = 20;        // [4:.01:30]
Base_R  = Base_D/2;




/* [Belt Retainers] */

// Top Belt Retainer
Retnr_T = false;

// Bottom belt Retainer
Retnr_B = false;

// Height of Top Belt Retainer
Retnr_T_H = 1.5;     // [1:.01:10]

// Height of Bottom Belt Retainer
Retnr_B_H = 1.5;     // [1:.01:10]



/* [Tooth] */

// Enable Teeth false diameter + T_Dia + Dshaft_D
T_Ena = true;

T_OD = 10;       // [1:.01:30]

// Tooth Profile
T_Prof_Idx = 5;   // [0:MXL,1:40DP,2:XL,3:H,4:T2.5,5:T5,6:T10,7:AT5,8:HTD_3mm,9:HTD_5mm,10:HTD_8mm,11:GT2_2mm,12:GT2_3mm,13:GT2_5mm]

// Number of T_Count, standard Mendel T5 belt = 8, gives Outside Diameter of 11.88mm
T_Count   = 8;    // [3:1000]



/* [Drive Shaft] */

// NEMA17 motor shaft exact diameter = 5
DShaft_D = 5.2;      // [0:.01:10]

// Half shaft fraction
DShaft_F = .2;       // [0:.01:.5]



/* [Grub Screw] */

Grub_nut_hex = true;    // false = square nut

// Number of Grub screws
Grub_Count = 1;         // [0:3]

// Starting Phase for Grub screws
Grub_Phase = 0;         // [0:180]

// Angle between Grub screws
Grub_Angle = 90;        // [0:180]

// Normal M3 hex nut exact width = 5.5
Grub_D = 3.2;           // [2:.01:10]

Grub_nut_flats = 5.7;   // [2:.01:10]

// Normal M3 hex nut exact depth = 2.4, nyloc = 4
Grub_nut_depth = 2.7;   // [2:.01:10]

// Distance between inner face of nut and shaft, can be negative.
Grub_Nut_R = 1.2;       // [1:.01:10]



// ********************************
// ** Scaling tooth for good fit **
// ********************************


/* [Tweaks] */

// To improve fit of belt to Pully, set the following constant. Decrease or increase by 0.1mm at a time. We are modelling the *BELT* tooth here, not the tooth on the Pully. Increasing the number will *decrease* the Pully tooth size. Increasing the tooth width will also scale proportionately the tooth depth, to maintain the shape of the tooth, and increase how far into the Pully the tooth is indented. Can be negative
Tooth_W_Extra = 0.2; //mm

// If you need more tooth depth than this provides, adjust the following constant. However, this will cause the shape of the tooth to change.
Tooth_D_Extra = 0; //mm



//--------------------
// Tooth T_Profiles
//
T_Profiles = [
// MXL() =
[[-0.660,-0.5], [-0.660,0],    [-0.622,0.006],
 [-0.588,0.023],[-0.560,0.049],[-0.541,0.084],
 [-0.417,0.424],[-0.398,0.459],[-0.371,0.485],
 [-0.336,0.502],[-0.298,0.508]],

// 40DP() =
[[-0.613,-0.5], [-0.613,0],    [-0.575,0.010],
 [-0.546,0.038],[-0.356,0.368],[-0.328,0.405],
 [-0.291,0.433],[-0.249,0.451],[-0.202,0.457]],

// XL() =
[[-1.525,-1],   [-1.525,0],    [-1.418,0.015],
 [-1.321,0.06], [-1.24,0.129], [-1.180,0.220],
 [-0.793,1.050],[-0.734,1.141],[-0.653,1.210],
 [-0.555,1.255],[-0.448,1.270]],

// H() =
[[-2.68,-1],[-2.68,0],[-2.601,0.006],
 [-2.525,0.024],[-2.454,0.053],[-2.388,0.092],
 [-2.329,0.140],[-2.278,0.197],[-2.235,0.262],
 [-2.202,0.334],[-1.752,1.571],[-1.72,1.643],
 [-1.677,1.708],[-1.625,1.765],[-1.566,1.813],
 [-1.501,1.852],[-1.429,1.881],[-1.354,1.899],
 [-1.275,1.905]],

// T2_5() =
[[-0.839,-0.5],[-0.839,0],[-0.770,0.022],
 [-0.726,0.079],[-0.529,0.621],[-0.485,0.678],
 [-0.416,0.7]],

// T5() =
[[-1.632,-0.5],[-1.632126,0],[-1.568549,0.004939],
 [-1.508,0.019],[-1.450023,0.042686],[-1.396912,0.074224],
 [-1.349,0.113],[-1.307581,0.159508],[-1.273186,0.211991],
 [-1.247,0.270],[-1.009802,0.920362],[-0.983414,0.978433],
 [-0.949,1.031],[-0.907524,1.076798],[-0.859829,1.115847],
 [-0.807,1.147],[-0.749402,1.170562],[-0.688471,1.184956],
 [-0.6251,1.19]],

// 10() =
[[-3.06511,-1],[-3.06511,0],[-2.971998,0.007239],
 [-2.882718,0.028344],[-2.79859,0.062396],[-2.720931,0.108479],
 [-2.651061,0.165675],[-2.590298,0.233065],[-2.539962,0.309732],
 [-2.501371,0.394759],[-1.879071,2.105025],[-1.840363,2.190052],
 [-1.789939,2.266719],[-1.729114,2.334109],[-1.659202,2.391304],
 [-1.581518,2.437387],[-1.497376,2.47144],[-1.408092,2.492545],
 [-1.314979,2.499784]],

// AT5() =
[[-2.134,-0.75],[-2.134,0],    [-2.058,0.005],
 [-1.985,0.022], [-1.915,0.048],[-1.85,0.083],
 [-1.79,0.127],  [-1.737,0.179],[-1.691,0.239],
 [-1.654,0.306], [-1.349,0.959],[-1.287,1.055],
 [-1.202,1.127], [-1.1,1.174],  [-0.987,1.19]],

// HTD_3mm() =
[[-1.135062,-0.5],[-1.135062,0],[-1.048323,0.015484],
 [-0.974284,0.058517],[-0.919162,0.123974],[-0.889176,0.206728],
 [-0.81721,0.579614],[-0.800806,0.653232],[-0.778384,0.72416],
 [-0.750244,0.792137],[-0.716685,0.856903],[-0.678005,0.918199],
 [-0.634505,0.975764],[-0.586483,1.029338],[-0.534238,1.078662],
 [-0.47807,1.123476],[-0.418278,1.16352],[-0.355162,1.198533],
 [-0.289019,1.228257],[-0.22015,1.25243],[-0.148854,1.270793],
 [-0.07543,1.283087],[0,1.28905]],

// HTD_5mm() =
[[-1.89036,-0.75],[-1.89036,0],[-1.741168,0.02669],
 [-1.61387,0.100806],[-1.518984,0.21342],[-1.467026,0.3556],
 [-1.427162,0.960967],[-1.398568,1.089602],[-1.359437,1.213531],
 [-1.310296,1.332296],[-1.251672,1.445441],[-1.184092,1.552509],
 [-1.108081,1.653042],[-1.024167,1.746585],[-0.932877,1.832681],
 [-0.834736,1.910872],[-0.730271,1.980701],[-0.62001,2.041713],
 [-0.504478,2.09345],[-0.384202,2.135455],[-0.259708,2.167271],
 [-0.131524,2.188443],[-0.000176,2.198511]],

// HTD_8mm() =
[[-3.301,-1],  [-3.301,0],    [-3.166,0.012],
 [-3.038,0.047],[-2.92,0.103], [-2.813,0.178],
 [-2.721,0.27], [-2.645,0.377],[-2.589,0.497],
 [-2.553,0.628],[-2.461,1.470],[-2.411,1.692],
 [-2.344,1.906],[-2.259,2.111],[-2.158,2.306],
 [-2.042,2.490],[-1.910,2.664],[-1.766,2.825],
 [-1.608,2.974],[-1.439,3.109],[-1.259,3.23],
 [-1.069,3.335],[-0.87,3.424], [-0.662,3.497],
 [-0.448,3.552],[-0.227,3.589],[0,3.607]],

// GT2_2mm() =
[[0.747,-0.5], [0.747,0],[0.648,0.037],
 [0.598,0.131], [0.579,0.238],[0.547,0.343],
 [0.505,0.444], [0.452,0.54],[0.358,0.637],
 [0.248,0.707], [0.127,0.75],
 [0,0.764]],

// GT2_3mm() =
[[-1.155,-0.5], [-1.155,0],     [-1.065,0.016],
 [-0.989,0.062], [-0.933,0.131], [-0.904,0.218],
 [-0.864,0.408], [-0.800,0.591], [-0.714,0.765],
 [-0.605,0.927], [-0.47,1.033],  [-0.321,1.108],
 [-0.163,1.153],
 [0,1.169]],

// GT2_5mm() =
[[-1.976,-0.75],[-1.976,0],[-1.798,0.032],
 [-1.647,0.121],[-1.535,0.256],[-1.474,0.427],
 [-1.447,0.571],[-1.412,0.713],[-1.369,0.852],
 [-1.319,0.989],[-1.261,1.123],[-1.196,1.254],
 [-1.123,1.381],[-1.044,1.504],[-0.935,1.612],
 [-0.818,1.706],[-0.693,1.786],[-0.562,1.852],
 [-0.426,1.903],[-0.286,1.939],[-0.144,1.961],
 [0,1.969]]

];




// calculated constants

Grub_nut_points = (Grub_nut_flats/cos(30)); // This is needed for the nut trap

// The following calls the Pully creation part,
// and passes the Pully diameter and tooth width to that module

xx=[
   [".08in MXL",.02*25.4,.052*25.4,OD_(p=2.032,u=.01*25.4)],

   ["40 D.P.",0.457,1.226,OD_(p=2.07264,u=0.1778)],

   ["1/5in XL",1.27,3.051,OD_(p=5.08,u=.01*25.4)],

   ["3/8 L",1.905,5.359,OD_(p=9.525,u=0.381)],

   ["T2.5", 0.7,1.678,TSCF_(0.7467,0.796,1.026)],
   ["T5",1.19,3.264,TSCF_(0.6523,1.591,1.064)],
   ["T10",2.5,6.130,OD_(p=10,u=1)],

   ["AT5",1.19,4.268,TSCF_(0.6523,1.591,1.064)],

// High Torque Drive

   ["HTD 3mm",1.289,2.270,OD_(p=3,u=.015*25.4)],
   ["HTD 5mm",2.199,3.781,OD_(p=5,u=.0225*25.4)],
   ["HTD 8mm",3.607,6.603,OD_(p=8,u=.027*25.4)],

// PolyChain GT

   ["GT2 2mm",0.764,1.494,OD_(p=2,u=.01*25.4)],
   ["GT2 3mm",1.169,2.310,OD_(p=3,u=.015*25.4)],
   ["GT2 5mm",1.969,3.952,OD_(p=5,u=.0225*25.4)]
];


 V=xx[T_Prof_Idx];
 Pully (Name=V[0],Tooth_D=V[1],Tooth_W=V[2],Pully_OD=V[3]);


//------------------------------
// Tooth Spacing from Curve Fit
//
function TSCF_(b,c,d) = let(P=T_Count^d) T_Count * c * P / (b + P);


//------------------
// Outside Diameter
//
// Call with
// p = Belt Tooth spacing (Pitch)
// u = Pitch_Line_Offset = "Distance from pitch line to Belt Tooth bottom U"
//
// pd = Pully Diameter = p*n/pi
// od = pd - 2 * u
//
function OD_(p,u) = T_Count*p/PI - 2*u;


//---------------------
// x-Mirror Point Set
//
function MirrorPS(PS) = let(t=(PS[len(PS)-1].x == 0)? 2: 1) concat(PS,[for(i=[len(PS)-t:-1:0]) [-PS[i].x,PS[i].y]]);



//---------------------
// Generate the Pully
//
module Pully(Name, Tooth_D, Tooth_W, Pully_OD) {

   Pully_OD = (T_Ena)? Pully_OD: T_OD+DShaft_D;

   echo (" ");
   echo ("===============");
   echo (str("Belt type = ",Name));
   echo (str("Tooth Count = ",T_Count));
   echo (str("Pully Outside Diameter = ",Pully_OD,"mm"));
   echo ("===============");
   echo (" ");

   Tooth_distance_from_centre = .5 * sqrt( Pully_OD^2 - Tooth_W+Tooth_W_Extra^2 );

   Tooth_Scale = [1+Tooth_W_Extra/Tooth_W, 1+Tooth_D_Extra/Tooth_D];

   Pully_OR = Pully_OD/2;


   difference() {

      Main_Body();

      Drive_Shaft();
      if (Base_Ena) Grubs();
      Top_Detent();
   }


   //---------------------------------------------
   // Generate Captive nut and grub screw holes
   //
   module Grubs() {
      if (Grub_Count > 0)
      if ( Base_H < Grub_nut_flats ) {
         echo ("CAN'T DRAW CAPTIVE NUTS, HEIGHT LESS THAN NUT DIAMETER!!!");
      } else {
         if ( (Base_D - DShaft_D)/2 < Grub_nut_depth + 3 ) {
            echo ("CAN'T DRAW CAPTIVE NUTS, DIAMETER TOO SMALL FOR NUT DEPTH!!!");
         } else {

            translate([0,0,Base_H/2])

            for(j=[0:Grub_Count-1])
               rotate(j*Grub_Angle+Grub_Phase)
               Grub_Cavity();
         }
      }
    }



   module Grub_Cavity() {

      rotate([90,0])

      translate([0,0,(DShaft_D+Grub_nut_depth)/2+Grub_Nut_R]) {

         // Grub Nut Pocket
         translate([0,-Base_H/4-0.5])
         cube([Grub_nut_flats,Base_H/2+1,Grub_nut_depth],center=true);

         // Grub Nut
         translate([0,0.25])
         rotate(90)
         if (Grub_nut_hex) {
            cylinder(d=Grub_nut_points,h=Grub_nut_depth,center=true,$fn=6);
         } else {
            cube([Grub_nut_flats,Grub_nut_flats,Grub_nut_depth],center=true);
         }
      }

      // Grub screw hole
      rotate([90,90,0])
      cylinder(d=Grub_D,h=Base_R+1,$fn=20);

   }



   //------------------
   // Drive Shaft Hole
   //
   module Drive_Shaft() {
      translate([0,0,-1])
      linear_extrude(Base_H + Sprocket_H + Retnr_T_H + Retnr_B_H+2)
      intersection() {
         circle(d=DShaft_D);
         rotate(Grub_Phase)
         translate([0,DShaft_D*DShaft_F])
         square(DShaft_D,center=true);
      }
   }



   module Top_Detent() {
      dz = ( Retnr_B )? Retnr_B_H: 0;
      dzz = ( Retnr_T )? Retnr_T_H: 0;

      translate([0,0,Base_H+Sprocket_H-Upper_Detent_H+dz+dzz])
      cylinder(d=Upper_Detent_D,h=Upper_Detent_H+.01);
   }




   module Main_Body() {
      if (Base_Ena) Base();
      Sprocket();
      Retainers();
   }



   //----------------------------
   // Base
   //
   module Base() {

      rotate_extrude($fn=Base_D*4) 
      if (Pully_OR >= (Base_R-1)) {
         polygon([[0,0],[Base_R,0],[Base_R,Base_H],[0,Base_H]]);
      } else {
         polygon([[0,0],[Base_R,0],[Base_R,Base_H-1],[Base_R-1,Base_H],[0,Base_H]]);

          if (Base_CrnrRnd)
             translate([Base_R-1,Base_H-1])
             circle(1);
         
      }
   }



   //------------------------------------------
   // Generate Belt Retainers Top and Bottom
   //
   module Retainers() {
      dz = ( Retnr_B )? Retnr_B_H: 0;

      if ( Retnr_T ) {
         translate ([0,0, Base_H + Sprocket_H +dz-.01])
         rotate_extrude()
         polygon([[0,0],[Pully_OR,0],
                  [Pully_OR + Retnr_T_H , Retnr_T_H],
                  [0 , Retnr_T_H],[0,0]]);
      }

      if ( Retnr_B ) {
         translate ([0,0, Base_H - Retnr_B_H +dz])
         rotate_extrude()
         polygon([[0,0],[Pully_OR + Retnr_B_H,0],
                  [Pully_OR , Retnr_B_H],[0 , Retnr_B_H],[0,0]]);
      }
   }


   //---------------------------
   // Generate Toothed Cylinder
   //
   module Sprocket() {
      dz = ( Retnr_B )? Retnr_B_H: 0;

      translate([0,0,Base_H+dz-.01])
      difference() {
         rotate (90/T_Count)
         cylinder(d=Pully_OD,h=Sprocket_H, $fn=T_Count*4);
         
         if (T_Ena)
         translate([0,0,-1])
         linear_extrude(height=Sprocket_H+2,convexity=5)
         for(i=[0:T_Count-1]) {
            rotate(i*(360/T_Count))
            translate([0,-Tooth_distance_from_centre])
            scale(Tooth_Scale)
            polygon(MirrorPS(T_Profiles[T_Prof_Idx]));
         }
      }
   }

}


