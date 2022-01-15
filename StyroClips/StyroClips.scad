length = 275;   // 550 for "short" side, 650 for "long" side
cdepth = 14;
cheight = 29.4;

$fn = 60;

// Spacing of 65 was chosen to keep hole spacing right with 325mm extrusion...
// Spacing of 55 was chosen to keep hole spacing right with 275mm extrusion...
module holes(spacing = 55, curr = 0) {
    if (curr < length / 2) {
        translate([0, 3, length / 2 + curr])
        rotate([90, 0, 0])
        cylinder(d = 3.2, h=cheight + 10);
        translate([0, 3, length / 2 - curr])
        rotate([90, 0, 0])
        cylinder(d = 3.2, h=50);
        holes(spacing, curr + spacing);
    }
}

module slot(len) {
    difference () {
        translate([0, -6, 0])
        linear_extrude(len)
        //polygon([[0,0], [3,0], [7,4], [3, 4], [3,6], [10, 6], [10, 8], [-10, 8], [-10, 6], [-3, 6], [-3, 4], [-7, 4], [-3, 0], [0, 0]]);
        polygon([[3, 4.5], [3,6], [10, 6], [10, 8], [-10, 8], [-10, 6], [-3,6], [-3, 4.5]]);
        holes();
    }
}

module double() {
    translate([10, 0, 0]) {
        slot(length);
        translate([-10, -10, 0])
        rotate([0, 0, 90])
        slot(length);
    }
    translate([-cheight, 0, 0])
    cube([cheight, 2, length]);
    translate([-2, 0, 0])
    cube([2, cheight, length]);

    difference() {
        translate([0, cheight, 0])
        cube([cdepth, 2, length]);
        translate([10, cheight - 1, 0])
        holes();
    }

    difference() {
        translate([-cheight - 2, -cdepth, 0])
        cube([2, cdepth, length]);
        rotate([0, 0, -90])
        translate([10, 0, 0])
        holes();
    }
    hull() {
        translate([-2, cheight, 0])
        cube([2, 2, length]);
        translate([-cheight - 2, 0, 0])
        cube([2, 2, length]);
    }
}

module single() {
    translate([10, 0, 0]) {
        slot(length);
    }
    translate([-2, 0, 0])
    cube([2, cheight + 2, length]);

    difference() {
        translate([0, cheight, 0])
        cube([cdepth, 2, length]);
        translate([10, 25, 0])
        holes();
    }
}

double();