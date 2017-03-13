
$width=10;
$height=2.5*$width;

// A
hull(){
    cube([5,1,5]);
    translate([$width/2,$height,0]) cube([5,1,5]);
}
