include <zahnrad.scad>
include <servoarm.scad>
include <microservo_SG90.scad>

//translate([0,7,5.1]) rotate([0, 180, 0]) servo_standard(20, 0);

module zahnrad() {
zahnstange_und_rad (modul=1, laenge_stange=0, zahnzahl_rad=14, hoehe_stange=4, bohrung_rad=7.2, breite=5, eingriffswinkel=20, schraegungswinkel=0, zusammen_gebaut=true, optimiert=true);
}

//ranslate([-5.80,23.5,10]) rotate([90,0,0]) SG90();

//servo_standard(20, 0);

module servo_arm() {
    translate([10,-63,25]) rotate([90,0,0]) cylinder(h = 10, r = 3.5, $fn = 64, center=true);
    translate([10,-63,9]) rotate([90,0,0]) cylinder(h = 10, r = 2.5, $fn = 64, center=true);

    translate([10,-58,10]) rotate([90,0,0]) linear_extrude(height = 10)
    polygon(points = [
        [-3.5, 15], // obere linke Ecke (halbe Breite von 7mm)
        [3.5, 15],  // obere rechte Ecke
        [2.5, 0],  // untere rechte Ecke (halbe Breite von 5mm)
        [-2.5, 0]  // untere linke Ecke
    ]);

}

rotate([90,0,0]) difference() {
    union() {
        translate([10,-60,18]) rotate([90,0,0]) zahnrad();
        translate([10,-63,14]) cube([8,4,22], center=true);  
        translate([10,-61,-15]) rotate([90,0,0]) cylinder(h=4,r=20);
 
    }

     #servo_arm();    
    translate([10,-60,-15]) rotate([90,0,0]) cylinder(h=10,r=17);
    translate([22,-64,-16]) cube([25,7,42], center=true);
    //translate([8,0,-1]) cube([15,15,5]);
        
    
}
        