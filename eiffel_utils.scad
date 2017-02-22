$w = .5;
$id = [0,0,0];

module leg_segment(start,vector,l1,l2){
translate(start){
    //bottom
    horizontal_plane(l1);
    //top
    translate(vector){
        horizontal_plane(l2);
    }
    
    $0 = $id;
    $1 = $id+[l1-$w,0,0];
    $2 = $id+[l1-$w,l1,0];
    $3 = $id+[0,l1,0];
    
    $4 = vector;
    $5 = vector+[l2-$w,0,0];
    $6 = vector+[l2-$w,l2,0];
    $7 = vector+[0,l2,0];
    
    //vertical columns
    diagonal_bar($0,$4);
    diagonal_bar($1,$5);
    diagonal_bar($3,$7);
    diagonal_bar($2,$6);
   
    //cross columns
    diagonal_bar($0,$5);
    diagonal_bar($1,$4);
    
    diagonal_bar($3,$4);
    diagonal_bar($0,$7);
    
    diagonal_bar($1,$6);
    diagonal_bar($2,$5);
    
    diagonal_bar($3,$6);
    diagonal_bar($2,$7);
}   
}

module horizontal_plane(length){
    cube([length,$w,$w]);
    translate([0,length,0]) cube([length,$w,$w]);
    translate([$w,0,0]) rotate([0,0,90]) cube([length,$w,$w]);
    translate([length,0,0]) rotate([0,0,90]) cube([length,$w,$w]);
}

module diagonal_bar(start,end){
    hull(){
        translate(start) cube([$w,$w,$w]);
        translate(end) cube([$w,$w,$w]);
    }
}

module leg(n,start,vector,ldelta,scale){
    for(x=[0 : n-1]){
        /*
        $start = start + [vector[0]*((1 - pow(ldelta,x))/(1 - ldelta)),
            vector[1]*((1 - pow(ldelta,x))/(1 - ldelta)),
            vector[2]*x];
        $vec = [vector[0] * pow(ldelta,x), vector[1] * pow(ldelta,x), vector[2]];
       
        leg_segment($start, $vec, scale*pow(ldelta,x-1), scale*pow(ldelta,x));
        */
        leg_segment(start+(x*vector), vector, scale - x, scale - x - 1);
    }
}

for(r=[0,1,2,3]){
    rotate([0,0,90*r]) leg(5,[-10,-10,0],[1,1,6],.95,10);
}