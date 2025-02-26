

width = 70;
height = 60;
corner_radius = 5;
extrude_length = 40;
/*
difference() {
    rounded_rectangle_3d(width, height, corner_radius, extrude_length);
    translate([2,2,-10]) rounded_rectangle_3d(width-4, height-4, corner_radius-4, extrude_length);
}
*/

module rounded_rectangle_3d(w, h, r, length) {
    union() {
        translate([r, 0, 0]) cube([w - 2*r, h, length]);
        translate([0, r, 0]) cube([w, h - 2*r, length]);
    
        translate([r, r, 0]) cylinder(h = length, r = r);
        translate([w - r, r, 0]) cylinder(h = length, r = r);
        translate([r, h - r, 0]) cylinder(h = length, r = r);
        translate([w - r, h - r, 0]) cylinder(h = length, r = r);
    }
}




module servo_mini_2(){
    translate([6,14.5,12]) rotate([90,-90,0]) {
        cube([23,12,25]);
        translate([5.5,5.75,0]) cylinder(h = 30, r = 5.5, $fn = 64);
        translate([5.5,5.75,0]) cylinder(h = 34.5, r = 2.5, $fn = 64);
        
        difference() { 
            translate([-4.25,1,22]) cube([31.5,11.5,3]);
            translate([-2,6,19]) cylinder(h = 6, r = 2.25, $fn = 64);
            translate([25,6,19]) cylinder(h = 6, r = 2.25, $fn = 64);
        }    
    }
} 


module loecher_head() {
        translate([0,8,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([0,-8,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([8,0,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([-8,0,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([17,0,18])  rotate([0,90,0]) cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([-17,0,18])  rotate([0,90,0]) cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        

}

module horn(){
        translate([0,-1,17.5]) rotate([90,0,0]) cylinder(h = 8, r = 3.5, $fn = 64, center=true);
        translate([0,-1,3.5]) rotate([90,0,0]) cylinder(h = 3, r = 2, $fn = 64, center=true);
        translate([0,0.5,4]) rotate([90,0,0]) linear_extrude(height = 3)
        polygon(points = [
            [-3, 14], // obere linke Ecke (halbe Breite von 7mm)
            [3, 14],  // obere rechte Ecke
            [2, 0],  // untere rechte Ecke (halbe Breite von 5mm)
            [-2, 0]  // untere linke Ecke
        ]);

}


module neck_link() {
    
    translate([0,0,-22])  {
        difference() {
            translate([0,0,0]) cylinder(h = 1.5, r = 11.5, $fn = 64);
            translate([0,0,-1]) cylinder(h = 10, r = 4.5, $fn = 64);
            translate([-18,0,-5]) cube([20,30,22], center=true);
            loecher_head();
        }

        difference() {
            
            cylinder(h = 22, r = 17.6, $fn = 64);
            translate([0,0,2]) cylinder(h = 30, r = 16.5, $fn = 64);
            difference() {
                translate([0,0,-1]) cylinder(h = 10, r = 16.5, $fn = 64);
                translate([0,-20,-9]) cube([40,50,22]);
                
            }
             
            translate([0,0,-1]) cylinder(h = 10, r = 4.5, $fn = 64);
            //translate([0,0,22]) neck();
            loecher_head();
        }

    }
}



module neck() {

    difference() {
        union() {
            translate([0,0,-10]) cylinder(h = 18, r = 20, $fn = 64);
            //translate([5,0,0]) cube([30,50,2], center=true);
            translate([0,-17,17.5]) rotate([90,0,0]) cylinder(h = 4, r = 5.5, $fn = 64);   
            translate([-5.5,-21,-10]) cube([11,4,28]);
            translate([0,21,17.5]) rotate([90,0,0]) cylinder(h = 4, r = 5.5, $fn = 64);  
            translate([-5.5,17,-10]) cube([11,4,28]);
            
            
        }

        translate([0,0,-11]) cylinder(h = 22, r = 17.6, $fn = 64);
        translate([0,20,17.5]) rotate([90,0,0]) cylinder(h = 5, r = 3.55, $fn = 64, center=true);
        #servo_mini_2();
        translate([0,-18.5,0]) horn();
        translate([0,0,-22]) loecher_head();
    }
}


module stift() {
    difference() {
        union() {
            translate([-5.5,21,18]) cube([11,3,22]);
            translate([0,24,17.5]) rotate([90,0,0]) cylinder(h = 3, r = 5.5, $fn = 64);  
            translate([-17.5,14,38]) cube([35,10,2]);
            translate([0,24,17.5]) rotate([90,0,0]) cylinder(h = 6, r = 1.5, $fn = 64);
        }
        
        loecher_head_buttom();
    }

}

module servo_case() {
        difference() {
            union() {
                
                translate([-17.5,-6.5,38]) cube([35,10,2]);
                translate([-8,-6.5,6]) cube([15.5,15,34]);
            }
            translate([0,-4,9.5])  rotate([90,0,0]) cylinder(h = 10, r = 1.8, $fn = 64, center=true);
            translate([0,-4,37.5])  rotate([90,0,0]) cylinder(h = 10, r = 1.8, $fn = 64, center=true);
            loecher_head_buttom();
            servo_mini_2();
        }
}

module loecher_head_buttom() {
        translate([12,19,39])  cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([-12,19,39])  cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([12,-1,39])  cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([-12,-1,39])  cylinder(h = 10, r = 1.7, $fn = 64, center=true);
}

module head_buttom() {

    difference() {
        union() {
            translate([0,9,41]) cube([35,31,2], center=true); 
            translate([0,0,46]) cube([7,68,12], center=true); 
            translate([-18,8,46]) cube([30,7,12], center=true); 
            
        }
        translate([0,0,50]) cube([62,64,8], center=true); 

        loecher_upper_head();
        loecher_head_buttom();
        head();
    }

}

module loecher_upper_head() {
        translate([-34,8,49])  rotate([0,90,0]) cylinder(h = 20, r = 1.7, $fn = 64, center=true);
        translate([0,0,49])  rotate([90,0,0]) cylinder(h = 120, r = 1.7, $fn = 64, center=true);
}

module head() {

    difference() {
        union() {
        translate([30,-5,20]) cube([8,3,20],center=true);
        translate([30,-19,11])  cube([8,30,2],center=true);  
        
        }
        #translate([27,-34,10]) kamera();
    }

    difference() {
        union() {
            translate([0,0,35]) cube([69,69,50],center=true);
            
        }
        translate([0,0,35]) cube([66,66,51],center=true);
        //translate([30,20,40])  rotate([0,90,0]) cylinder(h = 40, r = 5, $fn = 64, center=true);
        //translate([30,-20,40])  rotate([0,90,0]) cylinder(h = 40, r = 5, $fn = 64, center=true);
        //translate([0,1,14])  cube([58,45,10],center=true);  

        loecher_upper_head();
        #translate([27,-34,10]) kamera();
        #translate([21,13,42]) rotate([-90,0,-90])lidar();
    }
    

}

module top(){
    head_buttom();
    neck_link();
    servo_case();
    neck();
    stift();
    head();
}

module kamera() {
    cube([3,28,40]);
    translate([0,9.75,28]) cube([6,8,8]);
    translate([-9,23,13]) cube([10,3,20]);
    translate([-9,1,13]) cube([10,3,20]);
    translate([0,13.75,32]) rotate([0,90,0]) cylinder(h = 11, r = 4.5, $fn = 64);
}

module head_top() {
   difference() {
      translate([0,0,59]) cube([69,69,6],center=true);
      translate([0,0,58]) cube([63,63,6],center=true);
      translate([-20,-20,58]) cylinder(h = 11, r = 3.5, $fn = 64);
      head();
   
   }


}

module lidar() {
    difference() {
        union() {
            linear_extrude(height=12) hull() {
                translate([-5.5, -3.25]) circle(r=7);
                translate([5.5, -3.25]) circle(r=7);
                translate([-9, 6.25]) circle(r=4);
                translate([9, 6.25]) circle(r=4);
            }
            translate([5.25,0,12]) cylinder(h = 2, r = 5.25, $fn = 64);
            translate([-5.25,0,12]) cylinder(h = 2, r = 5.25, $fn = 64);

            translate([15,0,0]) cylinder(h = 14, r = 1.7, $fn = 64);
            translate([-15,0,0]) cylinder(h = 14, r = 1.7, $fn = 64);
        }
    translate([0,0,13.5]) cube([1,10,3], center=true);
    }
}





//linear_extrude(height=3) rounded_polygon2();

//head_buttom();
//servo_case();
head();
//head_top();
//stift();
//neck_link();
//neck();
//top();