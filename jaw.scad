
module jaw() {
    for(i=[0:1:30]){  // 30 Zähne für gleichmäßige Verteilung
        rotate([0,0,(360/30)*i])
        translate([7.5,0])  // 7.5 mm für Radius (Durchmesser 15 mm)
            linear_extrude(3)
                circle(2,$fn=3); // Kleinere Dreiecke für schärfere Zähne
    }

    difference() {
      cylinder(h=3,r=8);
      translate([0,0,-1]) cylinder(h=5,r=2,$fn=25);
    }
    translate([6,0,0]) cube([10,4,3]);

    difference() {
        union() {
            translate([30,10,0]) cylinder(h=3,r=20);
            
        }
        translate([30,10,-1]) cylinder(h=5,r=17);
        translate([10,10,-1]) cube([40,20,5]);
        translate([10,0,-1]) cube([15,15,5]);
    }
}

jaw();
translate([0,18,0]) mirror([0,1,0]) rotate([0,0,-30]) jaw();
