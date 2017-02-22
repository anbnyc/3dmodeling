$leg=20;
$w = 5;
$inshift = -0.4;
$minshift = -0.3;
$mleg=11;

//lower legs
for(x=[$leg,-$leg]){
    for(y=[$leg,-$leg]){
        translate([x,0,y])
        hull(){
            translate([$inshift*x, $leg, $inshift*y])
                cube([$w,1,$w]);
            cube([$w,1,$w]);
        }
    }
}

//lower platform
translate([-.5*($leg+$w), $leg, -.5*($leg+$w)])
    cube([1.5*$leg, 5, 1.5*$leg]);

//lower platform arch
difference(){
translate([.5*$w,15,.5*$w]) rotate([-90,45,0])
    hollow_cone(4,51,40,10,1);
translate([.5*$w,-9,.5*$w])
    sphere(30,$fn=100);
}


//middle legs
for(x=[$mleg,-$mleg]){
    for(y=[$mleg,-$mleg]){
        translate([x,24,y])
        hull(){
            translate([$minshift*x, $leg, $minshift*y])
                cube([$w,1,$w]);
            cube([$w,1,$w]);
        }
    }
}

//middle platform
translate([-0.75*($mleg), 2*($leg)+$w-1, -0.75*($mleg)])
    cube([2*$mleg, 2, 2*$mleg]);

//middle platform frame
translate([.5*$w,41,.5*$w]) rotate([-90,45,0])
    hollow_cone(4,29,25,6,1);

//upper tower
translate([.5*$w,80,.5*$w]) rotate([-90,45,0])
    hollow_cone(4,22,6,70,1);

//viewing platform
translate([2.5,115,2.5]) rotate([90,22.5,0])
    cylinder(h=2,r=4,$fn=8);
translate([2.5,119,2.5]) rotate([90,45,0])
    cylinder(h=4,r1=2,r2=4,$fn=4);

module hollow_cone(sides,bottom_diameter,top_diameter,height,wall){
difference(){
cylinder(d1=bottom_diameter+wall,d2=top_diameter+wall,h=height,$fn=sides,center=true);
cylinder(d1=bottom_diameter,d2=top_diameter,h=height+.1,$fn=sides,center=true);
}
}
