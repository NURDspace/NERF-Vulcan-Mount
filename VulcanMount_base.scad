use <Servo.scad>;
use <VulcanMount.scad>;
use <NERF Vulcan.scad>;
use <Beerbot.scad>;
use <MCAD/nuts_and_bolts.scad>;
use <MCAD/bearing.scad>;

translate([0,0,-65-95-0]) %base();
translate([0,0,-85]) #cube([210,210,8],center=true);

rotate([0,0,0]) {
translate([0,40,101]) rotate([180,0,90]) #vulcan();
%cylinder_roller();
translate([-30+13.5,-10.75,0]) rotate([90,0,-90]) #hs311();
}


difference() {
union() {
translate([0,0,-60]) cube([70,120,60],center=true);
translate([-40,0,-40]) cube([15,87,80],center=true);
}
rotate([0,90,0]) cylinder(d=140,h=62,center=true);
rotate([0,90,0]) cylinder(d=85,h=81,center=true);

translate([-23.25,-50,-57]) rotate([0,90,0]) cylinder(r=11.5,h=7.5,center=true);
translate([-27,-50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([23.75,-50,-57]) rotate([0,90,0]) cylinder(r=11.5,h=7.5,center=true);
translate([20,-50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([-23.25,-50,-57]) rotate([0,90,0]) cylinder(r=11.5,h=7.5,center=true);
translate([-27,50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([-23.75,-50,-57]) rotate([0,90,0]) cylinder(r=11.5,h=7.5,center=true);
translate([20,50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([-30,50,-57]) rotate([0,90,0]) boltHole(size=8,length=100);
translate([30,50,-57]) rotate([0,90,0]) nutHole(size=8);
translate([-30,-50,-57]) rotate([0,90,0]) boltHole(size=8,length=100);
translate([30,-50,-57]) rotate([0,90,0]) nutHole(size=8);

translate([-30+13.5,-10.75,0]) rotate([90,0,-90]) hs311();

}