include <zahnrad.scad>
include <servoarm.scad>
include <microservo_SG90.scad>

translate([0,7,5.1]) rotate([0, 180, 0]) servo_standard(20, 0);
zahnstange_und_rad (modul=1, laenge_stange=0, zahnzahl_rad=14, hoehe_stange=4, bohrung_rad=8, breite=5, eingriffswinkel=20, schraegungswinkel=0, zusammen_gebaut=true, optimiert=true);
//ranslate([-5.80,23.5,10]) rotate([90,0,0]) SG90();

//servo_standard(20, 0);