//Based on https://github.com/fibasile/HS-311-OpenSCAD
 use <MCAD/boxes.scad>

servo_width = 41.55;
servo_depth = 21;
base_height = 26;
top_height = 6;
screws_distance_apart = 9;
screws_distance_width = 5;
screw_width=3;
ears_width = 56.4;
ears_height = 2;
ears_top_height = 0;
round_top_depth = 20;
round_top_width = 41.55;
round_top_height = 8;
rounded = 1.2;
top_cylinder_height=1.6;
top_cylinder_radius=7;
top_cylinder_offset = 2.5+top_cylinder_radius;
wheel_inner_cylinder_height = 7-top_cylinder_height;
wheel_inner_cylinder_radius = 9/2;
wheel_height=2;
wheel_radius=45/2.0;

cable_box_width = 9;
cable_box_depth = 5.5;
cable_box_height = 3.5;


$fs=0.01;

module double_horn() {
  hull() {
    cylinder(d=9,h=wheel_height,center=true);
    translate([27.5,0,0])cylinder(d=5,h=wheel_height,center=true);
    translate([-27.5,0,0])cylinder(d=5,h=wheel_height,center=true);
  }
}


module hs311_screw(){
	cylinder(h=2*ears_height, r=screw_width/2.0, center=true);
}

module hs311(position, rotation, screws = 0, axle_lenght = 0)
{
	translate(position)
	{
		rotate(rotation)
	    {
			union()
			{
                //main body
                roundedBox([servo_width,servo_depth,base_height],rounded,true);
				 translate([-servo_width/2.0,0,-base_height/2.0+cable_box_height/2.0]) roundedBox([cable_box_width,cable_box_depth,cable_box_height], rounded/10,true);
                translate([0,0,base_height/2.0 + ears_height /2.0]){
 	                union(){
                    roundedBox([ears_width, servo_depth, ears_height ],rounded,true);
					union(){

                    translate([(ears_width-screw_width)/2.0+0.01, screws_distance_apart/2.0, -ears_height]) hs311_screw();
                    translate([(ears_width-screw_width)/2.0+0.01, -screws_distance_apart/2.0, -ears_height]) hs311_screw();
                    translate([-(ears_width-screw_width)/2.0-0.01, screws_distance_apart/2.0, -ears_height]) hs311_screw();
                    translate([-(ears_width-screw_width)/2.0-0.01, -screws_distance_apart/2.0, -ears_height]) hs311_screw();
					}
					}


                    
    				translate([ 0,0, ears_height/2.0 + ears_top_height/2.0 ]){
	    	            roundedBox([servo_width,servo_depth, ears_top_height ],rounded,true);
						 translate([0,0,ears_top_height/2.0 + round_top_height/2.0]) {
							translate([(servo_width-round_top_width)/-2,0,0])
                                roundedBox([round_top_width,round_top_depth,round_top_height ],rounded,true);
							translate([-servo_width/2.0+top_cylinder_offset,0,round_top_height/2.0+top_cylinder_height/2.0]){
								cylinder(h=top_cylinder_height,r=top_cylinder_radius,center=true);
								translate([0,0,top_cylinder_height/2.0]) {
									cylinder(h=wheel_inner_cylinder_height,r=wheel_inner_cylinder_radius);
									  translate([0,0,wheel_inner_cylinder_height+wheel_height/2])
                                             rotate(90) double_horn();
;
									}
								}
                        }
					 }
				 }				                
            }
        }
    }
}



module test_hs311(){hs311();}

test_hs311();