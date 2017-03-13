// slider
translate([0,-20,0]){ //-7-7*sin($t*314)
    difference(){
        hull(){
            cube([32,8,1]);
            for(x=[0,32]){
                for(y=[0,8]){
                    translate([x,y,0]) cylinder(h=1,r=1,$fn=10);
                }
            }
        }
        //aperture
        hull(){
            for(x=[2,14]){
                for(y=[1,7]){
                    translate([x,y,-1])
                        cylinder(h=4,r=1,$fn=10);
                }
            }
        }
    }
    //bars
    for(x=[0,32]){
        translate([x,0,1])
        color([1,0,0])
        hull(){
            translate([0,7,0])
                sphere(.6);
            translate([0,1,0])
                sphere(.6);
        }
    }
}

//frame
color([0,.5,1])
translate([1,-6,-1]) {
    difference(){
        cube([16,12,3]);
        //aperture
        hull(){
            for(x=[3,13]){
                for(y=[3,9]){
                    translate([x,y,-1])
                        cylinder(h=6,r=1,$fn=10);
                }
            }
        }
        //lateral slat
        translate([-1,1,.95]) cube([18,10,1.05]);
    }
}