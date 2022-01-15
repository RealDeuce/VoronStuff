module midspan() {
    translate([-96.5, -116.5, -3])
    import("midspan_panel_clip_6mm_x3.stl");
    linear_extrude(12)
    projection(cut = true)
    translate([-96.5, -116.5, -3.01])
    import("midspan_panel_clip_6mm_x3.stl");
}

module corner() {
    translate([-96.5, -116.5, -3])
    import("corner_panel_clip_6mm_x4.stl");
    linear_extrude(12)
    projection(cut = true)
    translate([-96.5, -116.5, -3.01])
    import("corner_panel_clip_6mm_x4.stl");
}

corner();