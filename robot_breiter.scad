
include <zahnrad.scad>
include <servoarm.scad>
include <microservo_SG90.scad>

module legs(thickness=2) {
   difference() {
      hull() {
          cube([116+(2*thickness),126+(2*thickness),3], center = true);
          translate([10,0,150]) cube([76+(2*thickness),106+(2*thickness),10], center = true);
      }
      hull() {
          cube([116,126,4], center = true);
          translate([10,0,150]) cube([76,106,12], center = true);
      }
      //translate([10,0,150]) cube([78,110,10], center = true);
      
      
      // Löcher Anschlüsse
      if (thickness == 2) {
          translate([50,-20,124.5]) cube([10,5,18], center = true);
          translate([50,-27,124.5]) cube([10,5,18], center = true);
          translate([50,-34,124.5]) cube([10,5,18], center = true);
          translate([50,-13,124.5]) cube([10,5,18], center = true);
          translate([50,-6,124.5]) cube([10,5,18], center = true);
      }
      
      // Schraubenlöcher unten
      translate([60,0,8]) rotate([0,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
      translate([60,55,8]) rotate([0,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
      translate([60,-55,8]) rotate([0,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
      translate([-60,0,8]) rotate([0,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
      translate([-60,30 ,8]) rotate([0,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
      translate([-60,-30,8]) rotate([0,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
      
      
      schrauben_legs_upper();
   }
}

module schrauben_legs_upper() {
   translate([-10,-55,150]) rotate([90,90,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
   translate([28,-55,150]) rotate([90,90,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);  
   translate([-10,55,150]) rotate([90,90,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
   translate([28,55,150]) rotate([90,90,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);

}


module bottom() {

   translate([0,0,15]) rotate([0,0,90]) difference() {
       union() {
           // Bodenplatte
           cube([130,120,3], center = true);
           translate([0,-27,3]) cube([2.5,80,5], center = true);
           translate([0,27,10]) cube([75,38,20], center = true);
  
           
           // Würfel an den Seiten für Befestigung an den Beinen
           translate([62,35,4]) cube([10,50,10], center = true);
           translate([0,-55,4]) cube([130,10,10], center = true);
           translate([62,35,4]) cube([10,50,10], center = true);
       }     
       
       // schneide Beine von Boden ab
       translate([0,1,-15]) rotate([0,0,-90]) legs(thickness=15);

       // schneide Motor von Moterbefestigung ab
       translate([22.5,27.5,10]) cube([24.5,32,47], center = true);
       translate([-22.5,27.5,10]) cube([24.5,32,47], center = true);
       translate([0,27.5,18]) cube([25,22,30], center = true);
       translate([0,27.5,14]) cube([15,32,25], center = true);
       translate([-11,27.5,10]) cube([5,22,30], center = true);
       translate([11,27.5,10]) cube([5,22,30], center = true);

       // Löcher für Motorbefestigung
       translate([36,18,10]) rotate([0,90,0]) cylinder(h = 8, r = 2, $fn = 64, center = true);
       translate([36,36,10]) rotate([0,90,0]) cylinder(h = 8, r = 2, $fn = 64, center = true);
       translate([-36,18,10]) rotate([0,90,0]) cylinder(h = 8, r = 2, $fn = 64, center = true);
       translate([-36,36,10]) rotate([0,90,0]) cylinder(h = 8, r = 2, $fn = 64, center = true);

       // Löcher für die Räder
       translate([-48,27,-1]) cube([15,54,15], center = true);
       translate([48,27,-1]) cube([15,54,15], center = true);

       translate([-31,-27,-1]) cube([32,46,35], center = true);
       translate([31,-27,-1]) cube([32,46,35], center = true);


       // für Vorderradhalterungen
       translate([5,-13,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([-5,-13,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([5,-43,0])  cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([-5,-43,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);    

       translate([57,-13,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([-57,-13,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([57,-43,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([-57,-43,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);

       translate([51,-6,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([-51,-6,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([51,-47,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
       translate([-51,-47,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);            
   }    
}

module battery() {
    difference() {
        union() {
            translate([0,0,36.5]) cube([100,10,3], center = true);
            translate([20,0,45]) cube([43,86,20], center = true);

            // Fassungen für Säulen
            translate([37,-46,40]) cube([9,9,5], center = true);
            translate([37,46,40]) cube([9,9,5], center = true); 
            translate([-25,0,40]) cube([9,9,5], center = true);      
        }
        
        // Batterie
        translate([20,0,73]) #cube([39,82,70], center = true);
        translate([20,0,49]) cube([24,90,22], center = true);
        
        // Löscher für Batterieseite
        translate([20,22,36]) cube([30,23,6], center = true);
        translate([20,-22,36]) cube([30,23,6], center = true);
        translate([10,0,36]) cube([10,15,6], center = true);
        translate([30,0,36]) cube([10,15,6], center = true); 
        
        // Säulen
        translate([37,-46,76]) #cube([5,5,75], center = true);
        translate([37,46,76]) #cube([5,5,75], center = true);
        translate([-25,0,76]) #cube([5,5,75], center = true);
        
        // Löscher auf Motorseite
        translate([-27,19,36]) cube([30,29,6], center = true);  
        translate([-27,-19,36]) cube([30,29,6], center = true);  
 
       
        translate([6,51,36]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
        translate([6,-51,36]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
        translate([47,51,36]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
        translate([47,-51,36]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
        translate([20,4,36]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
        translate([20,-4,36]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);      
    }
}


module cables() {
    difference() {
        union() {
            translate([10,0,114.5]) cube([100,110,2], center = true);
            translate([20,0,105]) cube([43,86,20], center = true);
            
            // Fassungen für Säulen
            translate([39,-46,112]) cube([14,9,5], center = true);
            translate([39,46,112]) cube([14,9,5], center = true); 
            translate([-25,0,112]) cube([9,9,5], center = true);    
        }
        
        legs(thickness=10);
        
        translate([20,0,76]) cube([39,82,75], center = true);
        translate([20,0,102.5]) cube([24,90,22], center = true);
    
        // Säulen
        translate([37,-46,76]) cube([5,5,75], center = true);
        translate([37,46,76]) cube([5,5,75], center = true);
        translate([-25,0,76]) cube([5,5,75], center = true);
        
        translate([9,0,115]) loecher_cables_control();

        // Löscher
        translate([-16,14,115]) cube([25,15,6], center = true);
        translate([-16,32,115]) cube([25,12,6], center = true);
        translate([-16,-14,115]) cube([25,15,6], center = true);
        translate([-16,-32,115]) cube([25,12,6], center = true);

        translate([20,10,115]) cube([35,15,6], center = true);
        translate([20,30,115]) cube([35,15,6], center = true);
        translate([20,-10,115]) cube([35,15,6], center = true);
        translate([20,-30,115]) cube([35,15,6], center = true);   
    }
}

module schalter() {
    
    translate([0,18,6]) cube([20,2,15], center = true);
    translate([0,-18,6]) cube([20,2,15], center = true);
    
    difference() {
        cube([20,35,3], center = true);
        translate([0,-9,-12]) cylinder(h=20, r=5.7, $fn=64);
        
        // schalter
        translate([0,9,-3]) {
            cube([14,9,11.5], center=true);
            translate([0,0,6]) cube([15,10.5,1], center = true);
            translate([3,0,7]) cube([6,6,1], center=true);
        }
    }
}

module control() {
    difference() {
        union() {
            translate([10,0,134.5]) cube([90,110,2], center = true);
            translate([44,-20,123.5]) rotate([0,90,0]) schalter();
        }
        legs(10);
        
        // Löscher
        translate([-3,-47,135]) cube([22,8,6], center = true);
        translate([22,-47,135]) cube([20,8,6], center = true);
        translate([-6,8,135]) cube([28,8,6], center = true);
        translate([26,8,135]) cube([28,8,6], center = true);
        translate([-9,-20,135]) cube([34,20,6], center = true);
        translate([25,-20,135]) cube([25,20,6], center = true);
        translate([-9,30,135]) cube([34,12,6], center = true);
        translate([29,30,135]) cube([34,12,6], center = true);
        
        translate([9,0,135]) loecher_cables_control();
        translate([13,28,135]) loecher_esp32();
        
        // Motorshield L298n
        translate([7,-20,135]) {
            translate([18,18,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
            translate([-18,18,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
            translate([18,-18,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
            translate([-18,-18,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
        }
    }
}

module loecher_esp32() {
    translate([23,11.5,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
    translate([23,-11.5,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
    translate([-23,11.5,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
    translate([-23,-11.5,0]) cylinder(h = 6, r = 1.7, $fn = 64, center = true);
}

module neck() {
  translate([10, 0, 250]) difference() {
        translate([0, 0, 30]) cylinder(h = 15, r = 25, $fn = 64, center = true);
        translate([0, 0, 29]) cylinder(h = 40, r = 20, $fn = 64, center = true);
  }
}

module head() {
   translate([10, 0, 310]) difference() {
       union() {
           cube([80, 100, 60], center = true);
           //translate([0, 25,0]) rotate([0,90,0]) cylinder(h = 74, r = 20, $fn = 64, center = true);
           //translate([0, -25,0]) rotate([0,90,0]) cylinder(h = 74, r = 20, $fn = 64, center = true);
       }
   }
}


module motor() {
   cube([32, 24.5, 46]);
   translate([14,15,15]) rotate([90,90,0]) cylinder(h = 28, d = 3);
   translate([15,-8,15]) rotate([90,90,0]) cylinder(h = 8, r = 25);
}

module motoren() {
    translate([30,40,0]) {
        translate([-19,-75,-12]) #motor();
        translate([14,-5,-12]) rotate([0,0,180]) #motor();
        
    }
}

module halterung() {
    difference() {
        union() {
            translate([-20,6.5,0]) cube([40,3,15]);
            linear_extrude(5) polygon(points = [ [-20, 6.5], [20, 6.5], [5, 27], [-5, 27]]);
            translate([0,20,0]) cylinder(h = 5, r = 9, $fn = 64);     
       }
       
       translate([0,20, -1]) cylinder(h = 8, r = 5, $fn = 64);
       translate([15,10,10]) rotate([90,0,0]) cylinder(h = 8, r = 1.7, $fn = 64);
       translate([-15,10,10]) rotate([90,0,0]) cylinder(h = 8, r = 1.7, $fn = 64);

    }
}

module wheel() {
    cube([32,46,35], center = true);
    rotate([0,90,0]) cylinder(h = 25.5, r = 23.5, $fn = 64, center = true);
    rotate([0,90,0]) #cylinder(h = 50, r = 2.5, $fn = 64, center = true);
}

module halterungen() {
    // #wheel();
    translate([-16,0,20]) rotate([270,0,90]) halterung();
    translate([16,0,20]) rotate([270,0,270]) halterung();
}

module servo(kugellager=42) {
    cube([40.5,20,40]);
    translate([10,10,0]) cylinder(h = 45, r = 3, $fn = 64);
    translate([10,10,0]) cylinder(h = 41, r = 6.5, $fn = 64);
    
    
    // Kugellager
     translate([10,10,kugellager]) difference() {
         cylinder(h = 7, r = 23.5, $fn = 64);
         translate([0,0,-1]) cylinder(h = 9, r = 17.5, $fn = 64);
     }
         
    // Schraubenlöcher     
    difference() { 
        translate([-6.75,1.25,28]) cube([54,18.5,3.5]);
        translate([-5,5.5,27]) cylinder(h = 6, r = 2.25, $fn = 64);
        translate([-5,15,27]) cylinder(h = 6, r = 2.25, $fn = 64);
        
        translate([46,5.5,27]) cylinder(h = 6, r = 2.25, $fn = 64);
        translate([46,15,27]) cylinder(h = 6, r = 2.25, $fn = 64);
    }    
}    

/*
translate([0,0,0]) halterung();
translate([0,30,0]) halterung();
translate([60,0,0]) halterung();

translate([28,31,0]) rotate([0,0,-90]) halterungen();
translate([28,-31,0]) rotate([0,0,-90]) halterungen();
*/



module shoulder_front() {
    
    difference() {
        shoulders();
        translate([60, 0, 270]) cube([100, 120, 50], center = true);
    }
}

module shoulder_back() {
    
    difference() {
        shoulders();
        translate([-40, 0, 270]) cube([100, 120, 50], center = true);
    }
}


module shoulders_querbalken() {
 difference() {
    union() {
        translate([10, 22, 274]) cube([76, 15, 3], center = true);
        translate([10, -22, 274]) cube([76, 15, 3], center = true);
    }
    translate([10, 0, 272]) cylinder(h = 7, r = 23.5, $fn = 64);
    loecher_skeleton(); 
 }

}

module shoulders(thickness=0) {       
        difference() {
           translate([10, 0, 262]) {
            cube([80, 70, 50], center = true);
            translate([0, 35,0]) rotate([0,90,0]) cylinder(h = 80, r = 20+thickness, $fn = 64, center = true);
            translate([0, -35,0]) rotate([0,90,0]) cylinder(h = 80, r = 20+thickness, $fn = 64, center = true);       
           }

           translate([10, 0, 259]) {
            translate([-0.5, 0,0]) cube([77, 64, 34], center = true);
            translate([0, 0, -24]) cube([82, 120, 50], center = true);
            translate([-0.5, 33,0]) rotate([0,90,0]) cylinder(h = 77, r = 20, $fn = 64, center = true);
            translate([-0.5, -33,0]) rotate([0,90,0]) cylinder(h = 77, r = 20, $fn = 64, center = true);
            translate([0, 0, 23]) cylinder(h = 8, r = 23.65, $fn = 64, center = true);
            translate([0, 0, 24]) cylinder(h = 20, r = 20, $fn = 64, center = true);
            
            translate([0, 28, 24]) cube([70, 5, 4], center = true);
            translate([0, -28, 24]) cube([70, 5, 4], center = true);

            

           }
           
           torso_side();
           translate([10, -50, 259]) cube([25, 10, 10], center = true);
           mirror([0, 1, 0]) torso_side(); 
           translate([10, 50, 259]) cube([25, 10, 10], center = true);

           loecher_skeleton();
       }   
}

module torso() {           
       difference() {
            union() {
                translate([10,0,205]) cube([80,110,110], center = true);
                translate([10,0,150]) cube([78,109,10], center = true);  
            }
                
            translate([10,0,195])  cube([76,108,210], center = true);
               
            translate([-10,-55,150]) rotate([90,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
            translate([28,-55,150]) rotate([90,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);  
            translate([-10,55,150]) rotate([90,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true);
            translate([28,55,150]) rotate([90,90,0]) cylinder(h = 8, r = 1.7, $fn = 64, center = true); 
            
       }     
       
}    

module loecher_side() {
   translate([45.5,45,242.5]) rotate([90,0,0]) cylinder(h = 30, r = 1.7, $fn = 64, center = true);
   translate([45.5,45,233]) rotate([90,0,0]) cylinder(h = 30, r = 1.7, $fn = 64, center = true);
        
   translate([45.5,-45,242.5]) rotate([90,0,0]) cylinder(h = 30, r = 1.7, $fn = 64, center = true);
   translate([45.5,-45,233]) rotate([90,0,0]) cylinder(h = 30, r = 1.7, $fn = 64, center = true);
}

module torso_side() {  
    difference() {
        union() {
            translate([10,53.5,198])  cube([80,3,125], center = true);
            translate([10,52.75,262])  cube([74,1.5,3], center = true);
            translate([10,60,238]) rotate([90,0,0]) cylinder(h = 8, r = 30, $fn = 64);
        }
        translate([10,60,238]) rotate([90,0,0]) {
          translate([0,0,-4]) cylinder(h = 17, r = 18, $fn = 64);
          translate([0,0,-4]) cylinder(h = 10, r = 23.65, $fn = 64);
        }
        translate([-38,53.5,145]) cube([20,10,20], center = true);
        translate([58,53.5,145]) cube([20,10,20], center = true);
        legs();
        schrauben_legs_upper();
        loecher_servo_plate();
        loecher_side();
     }
}

module loecher_torso() {
    translate([10,45,250]) rotate([0,90,0]) cylinder(h = 100, r = 1.7, $fn = 64, center = true);
    translate([10,-45,250]) rotate([0,90,0]) cylinder(h = 100, r = 1.7, $fn = 64, center = true);
    translate([10,45,170]) rotate([0,90,0]) cylinder(h = 100, r = 1.7, $fn = 64, center = true);
    translate([10,-45,170]) rotate([0,90,0]) cylinder(h = 100, r = 1.7, $fn = 64, center = true);
}


module torso_back() { 
    difference() {
        translate([49,0,207.5])  cube([2,104,105], center = true);
        loecher_torso();
        loecher_servo_shield();
    }
    
}

module torso_front() { 
    difference() {
        translate([-29,0,207.5])  cube([2,104,105], center = true);
        loecher_torso();
    }
}


module loecher_servo_plate(back) {
        
        translate([-22,45,233.5]) rotate([90,0,0]) cylinder(h = 30, r = 1.7, $fn = 64, center = true);
        translate([-22,-45,233]) rotate([90,0,0]) cylinder(h = 30, r = 1.7, $fn = 64, center = true);
        
        // Schraubenloecher Arme Servos
        translate([-5,37,242.5]) rotate([90,0,0]) cylinder(h = 20, r = 1.7, $fn = 64, center = true);
        translate([-5,37,233]) rotate([90,0,0]) cylinder(h = 20, r = 1.7, $fn = 64, center = true);
        translate([-5,-37,242.5]) rotate([90,0,0]) cylinder(h = 20, r = 1.7, $fn = 64, center = true);
        translate([-5,-37,233]) rotate([90,0,0]) cylinder(h = 20, r = 1.7, $fn = 64, center = true);
       
        // Schraubenloecher Head Servo
        translate([-5,-4.5,242.5]) cylinder(h = 40, r = 1.7, $fn = 64, center = true);
        translate([-5,4.5,242.5]) cylinder(h = 50, r = 1.7, $fn = 64, center = true);

        translate([45.5,-4.5,242.5]) cylinder(h = 50, r = 1.7, $fn = 64, center = true);
        translate([45.5,4.5,242.5]) cylinder(h = 50, r = 1.7, $fn = 64, center = true);
        
}



module servo_plate() {
    difference() {
        union() {
            
            // Platte
            translate([10,0,226.5]) cube([75,103.5,3], center=true);
            
            // Halterungen Motor
            translate([-4,-43,237]) cube([7,3,20], center=true);
            translate([-4,43,237]) cube([7,3,20], center=true);
            
            //Fixierung Motor
            translate([44,0,230]) cube([7,30,5], center=true);
            translate([-4,0,230]) cube([7,30,5], center=true);    
            
            translate([-21.5,-47.5,233]) cube([10,5,10],center = true); 
            translate([-21.5,47.5,233]) cube([10,5,10],center = true);  
        }
        
        translate([20,27,226]) cube([28,24,10], center=true);
        translate([20,-27,226]) cube([28,24,10], center=true);
        translate([20,0,226]) cube([28,10,10], center=true);
        
        translate([-20,0,226]) cube([20,70,10], center=true);

        skeleton_back(false);
        skeleton_front(false);
        loecher_servo_plate();

    }
}

module skeleton_pillar_back() {
 
    difference() {   
    union() {
        cube([15,10,137], center=true);    
    }
    translate([-2,-2,-24]) cube([15,10,84],center = true);
    translate([-7,-2,39]) cube([15,10,36],center = true);
  }

}

module skeleton_pillar_front() {
  difference() {   
    cube([15,15,137], center=true);
    translate([-2,-2,-24]) cube([15,15,84],center = true);
    translate([-2,-2,39]) cube([15,15,36],center = true);
  }

}

module skeleton_back(remove_shoulder=true) {
      difference() {
        union() {
            translate([40.5,47,204]) skeleton_pillar_back();
            mirror([0,1,0]) translate([40.5,47,204])  skeleton_pillar_back();
            translate([40.5,0,223.5]) cube([15,90,3],center = true);
            translate([40.5,0,271]) cube([15,90,3],center = true);
            translate([28,51,150]) cube([10,2,10],center = true);
            translate([28,-51,150]) cube([10,2,10],center = true);
        }
        translate([9,0,135]) loecher_cables_control();
 
        translate([43,-4.5,271]) cylinder(h = 20, r = 3, $fn = 64, center = true);
        translate([43,4.5,271]) cylinder(h = 20, r = 3, $fn = 64, center = true);
        
        schrauben_legs_upper();
        if (remove_shoulder) {
            shoulders(20);
        }
        loecher_torso();
        loecher_servo_plate();
        loecher_side();
    }
}

module skeleton_front(remove_shoulder=true) {
        difference() {
           union() {
            translate([-21.5,44.5,204]) mirror([1,0,0])   skeleton_pillar_front();
            translate([-21.5,-44.5,204]) mirror([1,1,0])   skeleton_pillar_front();
            translate([-21.5,0,271]) cube([15,90,3],center = true);
            translate([-9,51,150]) cube([10,2,10],center = true);
            translate([-9,-51,150]) cube([10,2,10],center = true);             
        }
        translate([9,0,135]) loecher_cables_control();

        loecher_skeleton();

        schrauben_legs_upper();
        if (remove_shoulder) {
            shoulders(20);
        }
        loecher_torso();
        loecher_servo_plate();
    }
}

module loecher_skeleton() {
    translate([-21,20,271]) cylinder(h = 40, r = 1.7, $fn = 64, center = true);
    translate([-21,-20,271]) cylinder(h = 40, r = 1.7, $fn = 64, center = true);

    translate([41,20,271]) cylinder(h = 40, r = 1.7, $fn = 64, center = true);
    translate([41,-20,271]) cylinder(h = 40, r = 1.7, $fn = 64, center = true);
}


module loecher_cables_control(middle=true) {
    if (middle == true) {
        translate([-14,0,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
    }
    translate([33,46,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
    translate([-29,43,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
    translate([33,-46,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
    translate([-29,-43,0]) cylinder(h = 15, r = 1.7, $fn = 64, center = true);
}


module servos() {
    translate([0,-10.5,228]) rotate([90,0,0])#servo();
    translate([0,10.5,248]) rotate([270,0,0])#servo();
    translate([0,-10,228]) #servo(53);
}



/*
difference() {
    rotate([90,0,0]) torso_side();
  //  translate([-49,-370,40]) cube([100,200,50]);
}

difference() {
   cylinder(h = 7, r = 25, $fn = 64);
   translate([0,0,-1]) cylinder(h = 9, r = 23.65, $fn = 64);
}
*/



module show_robot() {
    //rotate([90,0,0])  
    torso_side();
    //rotate([270,0,0]) 
    mirror([0, 1, 0]) torso_side(); 
    torso_front();
    //rotate([0,-90,0]) 
    torso_back();
    //bottom();
    //battery();
    //rotate([180,0,0]) 
    //cables();
    //rotate([180,0,0]) 
    //control();
    //servos();
    legs();
    //rotate([0,270,0]) 
    //skeleton_front();
    //skeleton_back();
    //shoulders_querbalken();
    //servo_plate();
    //rotate([0,-90,0]) 
    shoulder_front();
    //rotate([0,90,0]) 
    shoulder_back();
    //servo shield
    //neck();
    //head();
}


module loecher_servo_shield() {
     translate([45,-8,195]) {
        //cube([5,62,26], center=true);
        translate([0,28,9.5]) rotate([0,90,0]) cylinder(h = 20, r = 1.5, $fn = 64, center = true);
        translate([0,-28,9.5]) rotate([0,90,0]) cylinder(h = 20, r = 1.5, $fn = 64, center = true);
        translate([0,-28,-9.5]) rotate([0,90,0]) cylinder(h = 20, r = 1.5, $fn = 64, center = true);
        translate([0,28,-9.5]) rotate([0,90,0]) cylinder(h = 20, r = 1.5, $fn = 64, center = true);
     }
}


module loecher_shoulder_link() {
        translate([0,8,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([0,-8,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([8,0,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([-8,0,-1])  cylinder(h = 5, r = 1.5, $fn = 64);
        translate([17,0,11])  rotate([0,90,0]) cylinder(h = 5, r = 1.7, $fn = 64, center=true);
        translate([-17,0,11])  rotate([0,90,0]) cylinder(h = 5, r = 1.7, $fn = 64, center=true);

}

module shoulder_link() {
    
    translate([10,-55,238]) rotate([90,0,0]) {
        difference() {
            translate([0,0,0]) cylinder(h = 1.5, r = 11.5, $fn = 64);
            translate([0,0,-1]) cylinder(h = 10, r = 4.5, $fn = 64);
            loecher_shoulder_link();
        }

        difference() {
            
            cylinder(h = 15, r = 17.6, $fn = 64);
            translate([0,0,2]) cylinder(h = 25, r = 16.5, $fn = 64);
            difference() {
                translate([0,0,-1]) cylinder(h = 10, r = 16.5, $fn = 64);
                translate([-20,0,-9]) cube([40,50,22]);
            }
            translate([0,0,-1]) cylinder(h = 10, r = 4.5, $fn = 64);
            
            loecher_shoulder_link();
        }

    }
}

module upper_arm() {

    difference() {
        union(){
            #translate([10,-75.5,238]) rotate([90,0,0]) cylinder(h = 40, r = 18.5, $fn = 64, center=true);
        }
        translate([10,-73.5,238]) rotate([90,0,0]) cylinder(h = 50, r = 17.6, $fn = 64, center=true);
        #translate([11,-51,238]) rotate([90,0,0]) loecher_shoulder_link();
        translate([10,-84,220]) cube([4,10,10], center=true);
 
    }

    difference() {
        union(){
            translate([12,-85.5,205]) cube([17,18,5], center=true);
            translate([12,-85.5,176]) cube([15,18,5], center=true);
        }
        #translate([4.25,-94,179.5]) rotate([-90,-90,0]) servo_mini();
        translate([10,-76,176.5]) rotate([90,0,0]) cylinder(h = 10, r = 1.8, $fn = 64, center=true);
        translate([10,-76,204.5]) rotate([90,0,0]) cylinder(h = 10, r = 1.8, $fn = 64, center=true);
        translate([10,-87,175]) cube([4,8,10], center=true);
        translate([10,-84,185]) rotate([90,0,0]) cylinder(h = 50, r = 3.55, $fn = 64, center=true);
    }


    difference() {
        union() {
          translate([10,-84,209]) cube([25,23,50], center=true);
          translate([10,-84,185]) rotate([90,0,0]) cylinder(h = 23, r = 15, $fn = 64, center=true);

        }
        translate([10,-73.5,238]) rotate([90,0,0]) cylinder(h = 50, r = 17.6, $fn = 64, center=true);
        translate([10,-84,185]) rotate([90,0,0]) cylinder(h = 50, r = 3.55, $fn = 64, center=true);
        translate([10,-82,209]) cube([21,23,50], center=true);
        translate([10,-73.5,238]) rotate([90,0,0]) cylinder(h = 40, r = 17.6, $fn = 64, center=true);
        translate([10,-82,185]) rotate([90,0,0]) cylinder(h = 23, r = 13, $fn = 64, center=true);
        translate([5,-79,173]) cube([20,15,10], center=true);
        translate([10,-87,170]) cube([4,8,10], center=true);
    }

}

module elbow_cover(side) {
   
        if (side != "left") {
            translate([10,-95,185]) rotate([90,0,0]) cylinder(h = 5, r = 1.5, $fn = 64, center=true);
            difference() {
                translate([10,-81,160]) cube([6,32,6], center=true);
                translate([10,-67,160]) rotate([90,0,90]) cylinder(h = 20, r = 1.6, $fn = 64, center=true);
            }
        }

       
       difference() {
        union() {
            translate([10,-80,185]) rotate([90,0,0]) cylinder(h = 36, r = 15, $fn = 64, center=true);
            translate([10,-80,158]) rotate([90,0,0]) cylinder(h = 36, r = 5, $fn = 64, center=true);
            translate([10,-80,165]) cube([10,36,15], center=true);
        }
        translate([10,-82.5,185]) rotate([90,0,0]) cylinder(h = 27, r = 16.5, $fn = 64, center=true);
        translate([10,-83,148]) cube([22,24,50], center=true);
        translate([10,-68,185]) rotate([90,0,0]) cylinder(h = 8, r = 12, $fn = 64, center=true);
        //#translate([10,-65,185]) rotate([90,180,0]) servo_mini_horn();

        translate([10,-67,160]) rotate([90,0,90]) cylinder(h = 20, r = 1.6, $fn = 64, center=true);

        translate([10,-64,185]) rotate([90,180,0]) cylinder(h = 5, r = 3.5, $fn = 64, center=true);
        translate([10,-63,169]) rotate([90,180,0]) cylinder(h = 4, r = 2.5, $fn = 64, center=true);
        translate([10,-61,170]) rotate([90,0,0]) linear_extrude(height = 4)
        polygon(points = [
            [-3.5, 15], // obere linke Ecke (halbe Breite von 7mm)
            [3.5, 15],  // obere rechte Ecke
            [2.5, 0],  // untere rechte Ecke (halbe Breite von 5mm)
            [-2.5, 0]  // untere linke Ecke
]);


        if (side == "left") {
            translate([10,-97,178]) cube([30,15,50], center=true);
            translate([10,-79,160]) cube([6,32,6], center=true);
        }
        else {
            translate([10,-66,178]) cube([30,15,50], center=true);
        }
       }      
}


module lower_arm() {
   
    //#translate([20,-91,125]) rotate([0,-90,0]) servo_mini();
    difference() {
        

        union() {      
            translate([10,-84,150]) cube([28,22,50], center=true);
            translate([10,-84,185]) rotate([90,0,0]) cylinder(h = 22, r = 17.5, $fn = 64, center=true);
        }
        
        translate([10,-84.5,130]) rotate([0,90,0]) cylinder(h = 40, r = 2.2, $fn = 64, center = true);
        translate([13,-84.5,143]) rotate([90,0,0]) cylinder(h = 40, r = 2.2, $fn = 64, center = true);
        translate([10,-82,185]) rotate([90,0,0]) cylinder(h = 28, r = 16.5, $fn = 64, center=true);
        translate([10,-82,148]) cube([24,20,50], center=true);
        translate([10,-84,191]) cube([40,24,30], center=true);
        elbow_cover();

    }      
    difference() {
        translate([10,-88,160]) cube([9,10,9], center=true); 
        elbow_cover();
 
    }
}

module lower_arm_cover() {
    difference() {
        translate([10,-74,150]) cube([28,6,50], center=true);
        translate([10,-84.5,138]) cube([24,15,26], center=true);       
        translate([10,-82,185]) rotate([90,0,0]) cylinder(h = 28, r = 16.5, $fn = 64, center=true);
        translate([13,-84.5,143]) rotate([90,0,0]) cylinder(h = 40, r = 1.7, $fn = 64, center = true);
        translate([10,-77,152]) cube([19,5,50], center=true);
        elbow_cover();
        lower_arm();
    }


}
   

module servo_mini(){
    cube([23,12,24.5]);
    translate([5.5,5.75,0]) cylinder(h = 28.5, r = 5.5, $fn = 64);
    translate([5.5,5.75,0]) cylinder(h = 31, r = 2.5, $fn = 64);
    
    
    // Kugellager
     /*
     translate([10,10,kugellager]) difference() {
         cylinder(h = 7, r = 23.5, $fn = 64);
         translate([0,0,-1]) cylinder(h = 9, r = 17.5, $fn = 64);
     }*/

    // Schraubenlöcher     
    difference() { 
        translate([-5,0,17.5]) cube([32.5,11.5,3.5]);
        translate([-5,13,27]) cylinder(h = 5.6, r = 2.25, $fn = 64);
        translate([46,5.5,27]) cylinder(h = 6, r = 2.25, $fn = 64);
    }    
} 

module cover_shoulder_link() {
  difference() {
        translate([10,-94,238]) rotate([90,0,0]) cylinder(h = 7, r = 18.5, $fn = 64, center=true);
        translate([10,-92,238]) rotate([90,0,0]) cylinder(h = 7, r = 15, $fn = 64, center=true);
        upper_arm();
  }
}

module cover_upper_arm() {
  difference() {
    union() {
        translate([10,-74,209]) cube([25,7,32], center=true);
        translate([10,-74,185]) rotate([90,0,0]) cylinder(h = 7, r = 15, $fn = 64, center=true);
    }
    translate([10,-76,207]) cube([19,7,40], center=true);
    translate([10,-76,185]) rotate([90,0,0]) cylinder(h = 7, r = 12, $fn = 64, center=true);
    translate([4.25,-94,179.5]) rotate([-90,-90,0]) servo_mini();
    translate([10,-75.5,238]) rotate([90,0,0]) cylinder(h = 40, r = 18.5, $fn = 64, center=true);
    upper_arm();

  }
}

module hand() {
    difference() {
        union() {
            translate([10,-82,100]) rotate([90,0,90]) cylinder(h = 24, r = 20, $fn = 64, center=true);
            translate([10,-84.5,123]) cube([24,15,26], center=true);   
        }
        translate([10,-84.5,130]) rotate([0,90,0]) cylinder(h = 40, r = 2.2, $fn = 64, center = true);
        translate([10,-82,100]) rotate([90,0,90]) cylinder(h = 25, r = 16, $fn = 64, center=true);
        translate([10,-82,83]) cube([25,20,10], center=true);   
    }

}


module arm() {
 shoulder_link();
 upper_arm();
 cover_upper_arm();
 cover_shoulder_link();
 lower_arm();
 lower_arm_cover();
 elbow_cover(side="left");
 elbow_cover(side="right");
 hand();
}

arm();
mirror([0,1,0]) lower_arm();

//show_robot();

