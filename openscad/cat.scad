$xshift = 70;

translate([-60,-55,-25])
    cube([120,1,50]);

translate([$xshift-5,20,0])
    union(){
        //neck
        translate([-18,-11,0]) rotate([0,90,32])
            cylinder(h=15,r1=16,r2=16);
        //head
        resize([34,36,38])
            sphere(20);
        

        hull(){
        //head
        resize([34,36,38])
            sphere(20);
        //nose
        $noseX = 14;
        $noseY = -6;
        translate([$noseX,$noseY,0]) intersection(){
            translate([-2,1,0]) rotate([180,-90,-10]) //16 -6 0
                cylinder(h=11,r1=14,r2=2,$fn=6);
            resize([16,24,26])
                sphere(15);
        }
        }

        for(x=[-10,10]){
            //ears
            translate([3,24,1.3*x]) rotate([90+2*x,0,-8])
                cylinder(h=12,r1=1,r2=8,$fn=3);
            //eyes
            translate([15,5,.6*x]) 
                resize([4,6,7]) 
                rotate([3*x,0,0])
                sphere(3);
        }
    };

translate([($xshift-73),-1,0]){
    //body
    union(){
        hull(){
        //neck
        translate([50,10,0]) rotate([0,90,32])
            cylinder(h=15,r1=16,r2=14);
        //torso
        translate([37,2,0])
            sphere(22);
        }
        hull(){
            translate([37,2,0])
                sphere(22);
            translate([-35,0,0])
                sphere(25);
            translate([-12,-5,0]) rotate([0,90,0])
                cylinder(h=1,r=25);
        }
    }
    // support plate
    translate([-12,-54,-15])
        cube([1,30,30]);
}
//tail
union(){
    translate([($xshift-180),50,0])
        sphere(3);
    for(x=[20,40,60,80,100]){
        hull(){
            translate([.5*x-(190-$xshift),1000/x,0]) 
                rotate([90,0,x])
                cylinder(h=1,r=3);
            translate([.5*x-(180-$xshift),1000/(x+20),0]) 
                rotate([90,0,(x+20)])
                cylinder(h=1,r=3);
        }
    }
}


for(x=[-10,10]){
    //rear thighs
    union(){
        hull(){
        translate([$xshift-115,-15,x]) rotate([90-1.5*x,0,-20])
            cylinder(h=25,r1=14,r2=3);
        translate([$xshift-123,-37,1.6*x])
            sphere(r=4);
        }
        hull(){
        translate([$xshift-115,-15,x]) rotate([90-1.5*x,0,-20])
            cylinder(h=25,r1=14,r2=3);
        translate([$xshift-109,-2,0])
            sphere(24);
        }
    }
    //below the knees
    $tibia = -52;
    union(){
        hull(){
            translate([$xshift-123,-37,1.6*x])
                sphere(r=4);
            translate([$xshift-116,$tibia,1.7*x])
                sphere(r=3);
        }
        hull(){
            translate([$xshift-116,$tibia,1.7*x])
                sphere(r=3);
            //feet
            translate([$xshift-114,$tibia-1,1.7*x]) 
                resize([8,4,5]) 
                rotate([0,0,0])
                sphere(r=3);
        }
    }
    
    //front legs
    hull(){
    translate([$xshift-35,-10,x])
        sphere(8);
    translate([$xshift-35,-20,x]) rotate([90-1.5*x,0,20])
        cylinder(h=35,r1=8,r2=3);
    }
    hull(){
    translate([$xshift-35,-20,x]) rotate([90-1.5*x,0,20])
        cylinder(h=35,r1=8,r2=3);
    translate([$xshift-23,-51,1.9*x])
        sphere(3);
    }
    //front paws
    hull(){
    translate([$xshift-20,-53,2*x]) 
        resize([10,4,6]) 
        rotate([0,0,-30])
        sphere(r=3);
    translate([$xshift-23,-52,1.9*x])
        sphere(3);
    }
}




