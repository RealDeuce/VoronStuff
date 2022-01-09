//edge_length = 484; // Top and bottom
edge_length = 624; // Left and Right sides
overall_width = 15;
height = 20;
spine = 2;

// Ideally, this would be 484x624
//overall_length = 244; // Top and bottom
overall_length = 314; // Sides

lbevel = (edge_length - overall_length < 5) ? (edge_length + spine * 2 - overall_length) / 2 : 0;
rbevel = (edge_length - overall_length < 5) ? (edge_length + spine * 2 - overall_length) / 2 : overall_width;

$fn = 60;

module bevel()
{
    translate([0, overall_width+1, height])
    rotate([90, 90, 0])
    linear_extrude(overall_width+1)
    polygon([[-1, -1], [height+1, -1], [-1, height+1]]);
}

module hinge()
{
    translate([0, -2.5, 0])
    difference() {
        hull() {
            cube([50, 2.5, 5]);
            translate([0, 0, 2.5])
            rotate([0, 90, 0])
            cylinder(d=5, h=50);
        }
        translate([-0.5, 0, 2.5])
        rotate([0, 90, 0])
        // 1.9 wasn't wuite enough here...
        cylinder(d=2, h=51);
    }
}

difference() {
    cube([overall_length, overall_width, height]);
    translate([-0.5, 1.62, spine])
    cube([overall_length+1, 2.9, height-spine + 1]);
    translate([-0.5, overall_width-1.62-2.9, spine])
    cube([overall_length+1, 2.9, height-spine + 1]);
    translate([-(height - lbevel), -0.5, 0])
    bevel();
    translate([overall_length + (height - rbevel) - 5, -0.5, 0])
    mirror([1, 0, 0])
    bevel();

    translate([25, -0.5, height / 2])
    rotate([-90, 0, 0])
    cylinder(d=1.8, h=overall_width + 1);
    translate([75, -0.5, height / 2])
    rotate([-90, 0, 0])
    cylinder(d=1.8, h=overall_width + 1);
    translate([125, -0.5, height / 2])
    rotate([-90, 0, 0])
    cylinder(d=1.8, h=overall_width + 1);
    translate([175, -0.5, height / 2])
    rotate([-90, 0, 0])
    cylinder(d=1.8, h=overall_width + 1);
    translate([225, -0.5, height / 2])
    rotate([-90, 0, 0])
    cylinder(d=1.8, h=overall_width + 1);
    translate([275, -0.5, height / 2])
    rotate([-90, 0, 0])
    cylinder(d=1.8, h=overall_width + 1);
}
//hinge_z = 5;
hinge_z = 0;
//hinge_y = overall_width;
hinge_y = 0;
translate([overall_length - 25 - 6 - 50, hinge_y, hinge_z])
//rotate([180, 0, 0])
hinge();
translate([overall_length - 25 - 6 - 151, hinge_y, hinge_z])
//rotate([180, 0, 0])
hinge();
translate([overall_length - 25 - 6 - 252, hinge_y, hinge_z])
//rotate([180, 0, 0])
hinge();
