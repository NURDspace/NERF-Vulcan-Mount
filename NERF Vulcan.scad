module bracket() {
difference() {
intersection() {
cylinder(r=72.7/2,h=8.9,center=true);
cube([52.5,90,10],center=true);
}
translate([40.25,0,-6.5/2]) cube([40,41,6],center=true);
translate([-40.25,0,-6.5/2]) cube([40,41,6],center=true);
//translate([-46,0,0]) cube([40,40,5],center=true);
}
}

module ammobox() {
difference () {
cube([93,155,152],center=true);
translate([0,-96,96]) rotate([45,0,0]) cube([100,100,100],center=true);
translate([0,-86,-86]) rotate([70,0,0]) cube([100,100,250],center=true);
}
}

module vulcan() {
union() {
translate([0,0,-3])cube([105,95,155],center=true);
translate([-(105+39.1)/2,0,3.5])cube([39.1,98,162],center=true);
translate([-(105+140)/2-39.1,0,2.5])cube([140,98,159],center=true);
translate([-(105+120)/2-140-39.1,0,4.5-(164-110)/2])cube([120,80,110],center=true);
translate([-(105+80)/2-140-39.1-120,0,4.5-(164-90)/2])cube([80,70,90],center=true);translate([(105+21.3)/2,0,3.5])cube([21.3,98,162],center=true);
translate([0,90,-95+155/2-36/2])cube([95,150,36],center=true);
translate([200,0,-95+155/2])rotate([0,90,0]) cylinder(r=48,h=260,center=true);
translate([-2.5,0,79]) rotate(90) bracket();
translate([0,-(98+155)/2+2,-3])ammobox();

}
}
vulcan();
