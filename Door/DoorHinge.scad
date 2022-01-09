$fn=60;

module hinge()
{
    translate([0, -2.5, 0])
    difference() {
        hull() {
            cube([24.5, 3, 5]);
            translate([0, -0.5, 2.5])
            rotate([0, 90, 0])
            cylinder(d=5, h=24.5);
        }
        translate([-0.5, -0.5, 2.5])
        rotate([0, 90, 0])
        // Initially used 1.9, but had to drill it out a bit.
        cylinder(d=2.0, h=26);
    }
}

difference() {
    union() {
        translate([0, 0, -4])
        cube([100, 4, 29]);
        translate([0, 3, 2])
        cube([100, 7, 23]);
        translate([0, -2, -4])
        cube([100, 2, 4]);
        translate([0, 0, 20])
        hinge();
        translate([75.5, 0, 20])
        hinge();
        translate([0, 6, -6])
        rotate([0, 90, 0])
        linear_extrude(100)
        polygon([[-2,-2], [-6,-2], [-6,2]]);
        translate([0, -4, -6])
        mirror([0, 1, 0])
        rotate([0, 90, 0])
        linear_extrude(100)
        polygon([[-2,-2], [-6,-2], [-6,2]]);
    }
    translate([-0.5, 2, 26])
    rotate([0, 90, 0])
    linear_extrude(101)
    polygon([[16,16], [0,0], [0,16]]);
}

