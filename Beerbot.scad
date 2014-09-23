module top() {
difference() {
union() {
cylinder(d=310,h=32);
translate([0,0,32])cylinder(d1=310,d2=280,h=20);
translate([0,0,52])cylinder(d=280,h=20);
}
cylinder(d=235,h=75);
translate([0,0,20])cylinder(d1=304,d2=280,h=20);
translate([0,0,-1])cylinder(d=304,h=21);
}
}

module base() {

difference() {
union() {
translate([0,0,20])cylinder(d=280,h=25);
translate([0,0,45])cylinder(d1=280,d2=310,h=20);
translate([0,0,65])cylinder(d=310,h=30);
translate([145/2,140/2,65/2])rotate([0,90,0]) cylinder(d=65,h=25,center=true);
translate([-145/2,140/2,65/2])rotate([0,90,0]) cylinder(d=65,h=25,center=true);
translate([145/2,-140/2,65/2])rotate([0,90,0]) cylinder(d=65,h=25,center=true);
translate([-145/2,-140/2,65/2])rotate([0,90,0]) cylinder(d=65,h=25,center=true);
}
translate([0,0,65])cylinder(d=290,h=45);
for (i = [0:60:300]) {
  rotate(i) {
  rotate(11.7100) translate([275/2,0,0])cylinder(d=3,h=450);
  rotate(-11.7100) translate([275/2,0,0])cylinder(d=3,h=450);
  }
}

//cylinder(d=310,h=98);
//cylinder(d=310,h=98);
}
}

module complete() {
base();
translate([0,0,95]) top();
}
$fn=30;

base();