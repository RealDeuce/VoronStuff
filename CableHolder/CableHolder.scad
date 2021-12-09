$fn = 32;

module CableSorter(sets, diameter = 1.5, spacing = 2.48, gap = 5.01, thickness = 2)
{
    m = max(sets);
    w = (len(sets) + 1) * (spacing + diameter + gap) + gap * 2;
    h = (spacing + diameter + 1) * m;

    module Holes(s, itemnum) {
        hh = s[itemnum] * (spacing + diameter);
        p = (h - hh) / 2;

        module drillWire(wpos, wremain) {
            translate(wpos)
            cylinder(d = diameter, h = thickness + 0.02);
            if (wremain > 1) {
                drillWire([wpos.x, wpos.y + spacing + diameter, wpos.z], wremain - 1);
            }
        }
        drillWire([gap + itemnum * (spacing + diameter * 2 + gap), p, -0.01], s[itemnum]);
        drillWire([gap + spacing + diameter + itemnum * (spacing + diameter * 2 + gap), p, -0.01], s[itemnum]);
        n = itemnum + 1;
        if (n < len(s)) {
            Holes(s, n);
        }
    }

    difference() {
        translate([0, -8, 0])
        cube([w, h + 8, thickness]);
        translate([10, -8, thickness - 0.99])
        rotate([0, 0, 90])
        linear_extrude(1)
        text("1", 10);
        Holes(sets, 0);
    }
}

CableSorter([2, 2, 4, 3, 2, 2, 2, 2, 4, 4]);