include <eiffel_utils.scad>;

$inshift = -0.4;
$minshift = -0.3;
$ctr = 2;

//lower legs
$leg=30;
$l_seg = 4;
$l_h = 6;
for(x=[0,1,2,3]){
    rotate([0,0,x*90]) translate([-$leg+4,-$leg+4,0])
        leg($l_seg,[0,0,0],[2.75,2.75,$l_h],1,10);
}

$l_plat_h = $l_seg*$l_h;
$l_plat_w = 1.1*$leg;
$plat = 4;
//lower platform
translate([-.5*$l_plat_w, -.5*$l_plat_w, $l_plat_h])
    platform($l_plat_w, $plat);

//lower platform arch
difference(){
translate([0,0,$l_plat_h-3]) rotate([0,0,45])
    hollow_cone(4,$l_plat_w+15,$l_plat_w+7,6,2);
translate([0,0,$l_plat_h-24])
    sphere($l_plat_w*.8,$fn=100);
}

$mleg=14;
$m_seg = 4;
$m_h = 6;
//middle legs
for(x=[0,1,2,3]){
    rotate([0,0,x*90]) translate([-$mleg,-$mleg,$l_plat_h + $plat])
        leg($m_seg,[0,0,0],[1.75,1.75,$m_h],.95,8);
}

$m_plat_h = $l_plat_h + $plat + $m_seg*$m_h;
$m_plat_w = 1.2*$mleg;
//middle platform
translate([-.5*$m_plat_w, -.5*$m_plat_w, $m_plat_h])
    platform($m_plat_w, 3);
//    cube([$m_plat_w, $m_plat_w, 2]);

//middle platform frame
translate([0, 0, $m_plat_h-2.5]) rotate([0,0,45])
    hollow_cone(4,$m_plat_w+6,$m_plat_w+2,6,2);

//upper tower
for(x=[0,1,2,3]){ //
    rotate([0,0,x*90]) translate([-7,-7,$m_plat_h+2]){
//        difference(){
        leg(17,[0,0,0],[.565,.565,5],.9,7);
//        translate([0,8,5]) cube([8,8,90]);
//        translate([8,0,5]) cube([8,8,90]);
//        translate([8,8,5]) cube([8,8,90]);
//        }
    }
}

//viewing platform
translate([0,0,139]){
    rotate([0,0,22.5]) cylinder(h=2,r=4,$fn=8);
    translate([-2.5,-2.5,2]) cube([5,5,2]);
    translate([0,0,7]) rotate([180,0,45]) cylinder(h=3,r1=2,r2=3.5,$fn=4);
} 

module platform(side,height){
    translate([0,0,3*height/4]) cube([side,side,height/4]);
    translate([1,1,height/4]) cube([side-2,side-2,height/2]);
    cube([side,side,height/4]);
}

module hollow_cone(sides,bottom_diameter,top_diameter,height,wall){
difference(){
cylinder(d1=bottom_diameter+wall,d2=top_diameter+wall,h=height,$fn=sides,center=true);
cylinder(d1=bottom_diameter,d2=top_diameter,h=height+.1,$fn=sides,center=true);
}
}
