wbH 				= 980;
cbH 				= 600;
tcbH 			= 400;
topCabH			= 1780;
roomWidth		= 2400;
roomLength		= 4100;
roomHeight		= 2400;
wbLength 		= 1860;
wbWidth 			= 635;
wbHeight 		= 38;
cabinet60x60x40	= [400,600,880];
cabinet40x60x40	= [400,400,880];
cabinet60x40x40	= [600,400,400];
cabinet40x40x40	= [400,400,400];
cabinet20x39x60	= [391,200,800];

// Side 1560 wide + door = 2100 - door
module room() {
	translate([-50, -50, 2400]) color("LightGrey",0.2) cube([2500, 4100, 50], center = false);
	translate([-50, -50, 0]) color("LightYellow",0.2) cube([50, 4100, 2400], center = false);

	difference() {
		translate([-50, -50, 0]) color("LightYellow",0.2) cube([2500, 50, 2400], center = false);
		translate([2400 - 860 , -60, 0]) {
			color("LightGrey",0.5) cube([860, 110, 2100], center = false);			
		}
	}

	difference() {
		translate([-50, -50, -50]) {
			color("LightGrey",0.5) cube([roomWidth + 100, roomLength + 100, 50], center = false);
		}
		
		translate([2349, 100, 0]) {
			color("LightGrey",0.5) cube([110, 1800, 2100], center = false);			
		}
	}
}

module desk() {
	// Computer
	translate([roomWidth - wbWidth, roomLength-wbLength, 700]) {
		color("BurlyWood", 1.0) cube([wbWidth, wbLength, wbHeight]);
	}

	// Printer
	translate([roomWidth - wbWidth, roomLength-wbLength-300, 700]) {
		color("BurlyWood", 1.0) cube([wbWidth, 300, wbHeight]);
	}

	// Electronics
	translate([0, roomLength-wbLength - wbWidth, 700]) {
		color("BurlyWood", 1.0) cube([wbWidth, wbLength, wbHeight]);
	}

	// Divider
	translate([0, roomLength - wbWidth, 700]) {
		color("BurlyWood", 1.0) cube([wbLength - 100, wbWidth, wbHeight]);
	}

	translate([2000, 3700,0]) legs();
	translate([2000, 2200,0]) legs();
	translate([200, 2200,0]) legs();
	translate([200, 3700,0]) legs();
}

module workbench() {
	translate([0, 0, wbH]) {
		color("BurlyWood", 1.0) cube([wbLength - 400, wbWidth, wbHeight]);
	}

	translate([0, wbWidth, wbH]) {
		color("BurlyWood", 1.0) cube([wbWidth, wbLength - 895, wbHeight]);
	}
}

module base_cabinets() {	
	
	translate([0, 400, 100]) {
		color("white", 1.0) cube(cabinet60x60x40);
	}

	translate([0, 1000, 100]) {
		color("white", 1.0) cube(cabinet60x60x40);
	}

	translate([1000, 0, 100]) {
		rotate([0, 0, 90]) color("white", 1.0) cube(cabinet60x60x40);
	}

	translate([1400, 0, 100]) {
		rotate([0, 0, 90]) color("white", 1.0) cube(cabinet40x60x40);
	}
	
	// Sockel
	translate([0, 400, 0]) {
		color("lightgrey", 1.0) cube([400, 1200, 100]);
	}

	// Sockel
	translate([400, 400, 0]) {
		rotate([0, 0, 270]) color("lightgrey", 1.0) cube([400, 1000, 100]);
	}
}

module top_cabinets() {
	translate([0, 0, topCabH]) color("white", 0.5) cube(400, 400, 400);
	
	translate([400, 0, topCabH]) {
		color("white", 1.0) cube(cabinet60x40x40);
	}

	translate([1000, 0, topCabH]) {
		color("white", 1.0) cube(cabinet40x40x40);
	}

	translate([400, 400, topCabH]) {
		rotate([0, 0, 90]) {
			color("white", 1.0) cube(cabinet60x40x40);
		}
	}
	
	translate([400, 1000, topCabH]) {
		rotate([0, 0, 90]) {
			color("white", 1.0) cube(cabinet60x40x40);
		}
	}	
}

module legs() {
	translate([0,0,680]) {
		cube([200,300,20]);
	}

	translate([40,80,0]) {
		cube([100,100,680]);
	}
}

translate([0, 1400, wbH]) color("white", 1.0) cube(cabinet20x39x60);
translate([1200, 391, wbH]) color("white", 1.0) rotate([0, 0, 270]) cube(cabinet20x39x60);
desk();
base_cabinets();
top_cabinets();
workbench();
room();