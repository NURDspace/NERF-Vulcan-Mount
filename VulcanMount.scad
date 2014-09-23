//using https://github.com/fibasile/HS-311-OpenSCAD 's Servo model.
use <Servo.scad>;
use <NERF Vulcan.scad>;
use <MCAD/nuts_and_bolts.scad>;

cob_offset=40;
cylinder_offset=16;
cylinder_diameter=130;
cylinder_thickness = 60;

module old_full_bracket() {
union() {
translate([-24.5,0,4.5]) cube([8,40,3.5],center=true);
translate([24.5,0,4.5]) cube([8,40,3.5],center=true);
translate([-27,0,1.5]) cube([3,40,4.5],center=true);
translate([27,0,1.5]) cube([3,40,4.5],center=true);
translate([0,0,-2]) cube([57,40,2.5],center=true);
}
}

module cylinder_roller() {
translate([0,0,cylinder_offset]) {
difference() {
union() {
translate([0,20,3]) cube([cylinder_thickness,85,10],center=true);
translate([0,-20,-2]) cube([cylinder_thickness-0.5,85,10],center=true);
translate([-cylinder_thickness/4-2.5,-12,-cylinder_offset]) cube([cylinder_thickness/2-10,43,25],center=true);
//translate([0,0,-cylinder_offset]) rotate([0,90,0]) #cylinder(d=3,h=90,center=true);

difference() {
translate([0,0,-cylinder_offset]) rotate([0,90,0]) cylinder(d=cylinder_diameter,h=cylinder_thickness,center=true);
translate([0,0,-cylinder_offset]) rotate([0,90,0]) cylinder(d=cylinder_diameter-10,h=cylinder_thickness-20,center=true);
translate([0,0,cylinder_diameter]) cube([cylinder_diameter*2,cylinder_diameter*2,cylinder_diameter*2],center=true);

}
}
translate([-cylinder_thickness/2+13,-10.75,-cylinder_offset]) rotate([90,0,-90]) hs311();
translate([0,cob_offset,83.5]) rotate([180,0,90]) vulcan();
translate([-cylinder_thickness/2+5,-52,-15]) rotate([0,90,0])boltHole(size=8,length=cylinder_thickness,tolerance=1);
translate([cylinder_thickness/2-6.4,-52,-15]) rotate([0,90,0])nutHole(size=8,length=cylinder_thickness,tolerance=0.2);
translate([-cylinder_thickness/2+5,52,-15]) rotate([0,90,0])boltHole(size=8,length=cylinder_thickness,tolerance=1);
translate([cylinder_thickness/2-6.4,52,-15]) rotate([0,90,0])nutHole(size=8,length=cylinder_thickness,tolerance=0.2);
translate([-cylinder_thickness/2+5,0,-65]) rotate([0,90,0])boltHole(size=8,length=cylinder_thickness,tolerance=1);
translate([cylinder_thickness/2-6.4,0,-65]) rotate([0,90,0])nutHole(size=8,length=cylinder_thickness,tolerance=0.2);

translate([0,-cylinder_offset-cylinder_diameter/2+15,-10]) rotate([90,0,0])cylinder(d=3,h=30,center=true);

}
}
}

module half_cylinder_roller(side=1) {
if (side % 2 ==1) {
translate([cylinder_thickness/4,0,0]) {
difference() {
cylinder_roller();
translate([cylinder_diameter*2,0,0])
cube([cylinder_diameter*4,cylinder_diameter*4,cylinder_diameter*4],center=true);
}
}
} else {
translate([-cylinder_thickness/4,0,0]) {
difference() {
cylinder_roller();
translate([-cylinder_diameter*2,0,0])
cube([cylinder_diameter*4,cylinder_diameter*4,cylinder_diameter*4],center=true);
}
}
}
}

rotate([0,180,0]) {
translate([-40,0,0]) rotate([0,90,0]) half_cylinder_roller(side=1);
translate([40,0,0]) rotate([0,-90,0]) half_cylinder_roller(side=2);
}

$fn=50;