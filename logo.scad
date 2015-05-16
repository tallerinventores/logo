$fn=90;

rotate([0,$t*360,0]) union() {
    color("green") minkowski() {
        os(5);
        cylinder(r=1, h=5);
    }
    color("blue") translate([0,0,100]) minkowski() {
        osh(5);
        cylinder(r=1, h=5);
    }
    color("yellow") translate([-60,-150,200]) scale(0.5) linear_extrude(height = 20, center = true, convexity = 10) import (file = "light-bulb.dxf");
}

module osh(alto) {
    difference() {
        union() {
            cylinder(r=130, h=alto);
            for(i=[0:45:359]) {
                rotate([0,0,i]) translate([0,120,0]) hull() {
                    translate([-24,54,0]) cube([47,1,alto]);
                    translate([-35,0,0]) cube([70,1,alto]);
                }
            }
        }
        union() {
            translate([0,0,-1]) cylinder(r=50, h=alto+2);
            hull() {
                translate([-5,-30,-1]) cube([10,1,alto+2]);
                translate([-65,-180,-1]) cube([130,1,alto+2]);
            }
        }
    }
}

module os(alto) {
    difference() {
        cylinder(r=175, h=alto);
        union() {
            translate([0,0,-1]) cylinder(r=50, h=alto+2);
            hull() {
                translate([-5,-30,-1]) cube([10,1,alto+2]);
                translate([-65,-180,-1]) cube([130,1,alto+2]);
            }
        }
    }
}

