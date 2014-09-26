use <Servo.scad>;
use <VulcanMount.scad>;
use <NERF Vulcan.scad>;
use <Beerbot.scad>;
use <MCAD/nuts_and_bolts.scad>;
use <MCAD/bearing.scad>;

translate([0,0,-65-84]) %base();

rotate([45,0,0]) {
translate([0,40,101]) rotate([180,0,90]) %vulcan();
%cylinder_roller();
}

module vulcan_base() {
difference() {
union() {
translate([0,0,-57]) cube([78,120,54],center=true);
translate([-40,0,-42]) cube([16.5,89,84],center=true);

translate([-5,40,-82]) difference() {hull () {
translate([-50,0,0])cylinder(r=10,h=4,center=true);
translate([50,0,0])cylinder(r=10,h=4,center=true);
}
translate([-50,0,0])cylinder(r1=1.5,r2=4,h=8,center=true);
translate([50,0,0])cylinder(r1=1.5,r2=4,h=8,center=true);
}
translate([-5,-40,-82]) difference() {hull () {
translate([-50,0,0])cylinder(r=10,h=4,center=true);
translate([50,0,0])cylinder(r=10,h=4,center=true);
}
translate([-50,0,0])cylinder(r1=1.5,r2=4,h=8,center=true);
translate([50,0,0])cylinder(r1=1.5,r2=4,h=8,center=true);
}

}

translate([-40,-45,0]) rotate([45,0,0]) cube([42,42,42],center=true);
translate([-40,45,0]) rotate([-45,0,0]) cube([42,42,42],center=true);

rotate([0,90,0]) cylinder(d=140,h=65,center=true);
translate([-20,0,0]) rotate([0,90,0]) cylinder(d=85,h=45,center=true);
translate([-45,0,-12]) rotate([0,90,0]) cylinder(d=2,h=30,center=true);
translate([-45,0,-24]) rotate([0,90,0]) cylinder(d=2,h=30,center=true);
translate([-23.25,-50,-57]) rotate([0,90,0]) cylinder(r=12,h=7.5,center=true);
translate([-27,-50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([23.75,-50,-57]) rotate([0,90,0]) cylinder(r=12,h=7.5,center=true);
translate([20,-50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([-23.25,-50,-57]) rotate([0,90,0]) cylinder(r=12,h=7.5,center=true);
translate([-27,50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([-23.75,-50,-57]) rotate([0,90,0]) cylinder(r=12,h=7.5,center=true);
translate([20,50,-57]) rotate([0,90,0]) #bearing(model="608");
translate([-33,50,-57]) rotate([0,90,0]) boltHole(size=8,length=100,tolerance=0.5);
translate([-50,50,-57]) rotate([0,90,0]) cylinder(d=15,h=15);
translate([-33,-50,-57]) rotate([0,90,0]) boltHole(size=8,length=100,tolerance=0.5);
translate([-50,-50,-57]) rotate([0,90,0]) cylinder(d=15,h=15);
translate([33,50,-57]) rotate([0,90,0]) nutHole(size=8,tolerance=0.5);
translate([33,-50,-57]) rotate([0,90,0]) nutHole(size=8,tolerance=0.5);

translate([-30+13.5,-10.75,0]) rotate([90,0,-90]) hs311();
}


}

vulcan_base();