$fn = 100;  // Glättung der Rundungen (Anzahl der Segmente)

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
    cube([23,12,25]);
    translate([5.5,5.75,0]) cylinder(h = 30, r = 5.5, $fn = 64);
    translate([5.5,5.75,0]) cylinder(h = 34.5, r = 2.5, $fn = 64);
    
    difference() { 
        translate([-4.25,1,22]) cube([31.5,11.5,3]);
        translate([-2,6,19]) cylinder(h = 6, r = 2.25, $fn = 64);
        translate([25,6,19]) cylinder(h = 6, r = 2.25, $fn = 64);
    }    
} 


module loecher_neck_link() {
        translate([0,8,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([0,-8,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([8,0,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([-8,0,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([17,0,16])  rotate([0,90,0]) cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([-17,0,16])  rotate([0,90,0]) cylinder(h = 10, r = 1.7, $fn = 64, center=true);

}

module horn(){
        translate([0,-1,17.5]) rotate([90,0,0]) cylinder(h = 8, r = 3.5, $fn = 64, center=true);
        translate([0,-1,4]) rotate([90,0,0]) cylinder(h = 3, r = 2, $fn = 64, center=true);
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
            loecher_neck_link();

        }

        difference() {
            
            cylinder(h = 22, r = 17.6, $fn = 64);
            translate([0,0,2]) cylinder(h = 30, r = 16.5, $fn = 64);
            difference() {
                translate([0,0,-1]) cylinder(h = 10, r = 16.5, $fn = 64);
                translate([0,-20,-9]) cube([40,50,22]);
            }
            translate([0,0,-1]) cylinder(h = 10, r = 4.5, $fn = 64);
            translate([0,0,22]) neck();
            loecher_neck_link();
        }

    }
}

module neck() {

    difference() {
        union() {
            translate([0,0,-10]) cylinder(h = 10, r = 20, $fn = 64);
            //translate([5,0,0]) cube([30,50,2], center=true);
            translate([0,-17,17.5]) rotate([90,0,0]) cylinder(h = 4, r = 5.5, $fn = 64);   
            translate([-5.5,-21,-10]) cube([11,4,28]);
            translate([0,20,17.5]) rotate([90,0,0]) cylinder(h = 3, r = 5.5, $fn = 64);  
            translate([-5.5,17,-10]) cube([11,3,28]);
            
            
        }

        translate([0,0,-11]) cylinder(h = 12, r = 17.6, $fn = 64);
        translate([0,0,17.5]) rotate([90,0,0]) cylinder(h = 50, r = 3.55, $fn = 64, center=true);
        #translate([-5.5,14.5,11.5]) rotate([90,0,0]) servo_mini_2();
        translate([0,-18.5,0]) horn();
        translate([0,0,-22]) loecher_neck_link();
    }
}


module head_buttom() {

    difference() {
        union() {
            translate([0,0,24.5]) cube([50,50,2], center=true); 
            translate([-5.5,20,17]) cube([11,3,8]);
            translate([0,23,17.5]) rotate([90,0,0]) cylinder(h = 3, r = 5.5, $fn = 64);  
            translate([0,23,17.5]) rotate([90,0,0]) cylinder(h = 6, r = 1.45, $fn = 64);  
            translate([-11,-7,12]) cube([34,3,12]);
        }
        translate([20,-6,17.5])  rotate([90,0,0]) cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([-8,-6,17.5])  rotate([90,0,0]) cylinder(h = 10, r = 1.7, $fn = 64, center=true);
        translate([-5.5,14.5,11.5]) rotate([90,0,0]) servo_mini_2();
    }

    
}
module head(){
    head_buttom();
    neck_link();
    neck();
}

head();

