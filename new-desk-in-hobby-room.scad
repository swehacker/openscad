wbH = 700;
cbH = 600;
tcbH = 400;
roomWidth = 2400;
roomLength = 4100;
wbLength = 1860;
wbWidth = 635;
wbHeight = 38;

module room() {
	difference() {
		translate([-50, -50, -50]) {
			color("LightGrey",0.5) cube([roomWidth + 100, roomLength + 100, 200], center = false);
		}
		
		translate([-50 + 2400 - 800 , -50, -50]) {
			color("LightGrey",0.5) cube([800, 110, 2100], center = false);			
		}

		translate([2349, 400, 0]) {
			color("LightGrey",0.5) cube([110, 1400, 2100], center = false);			
		}

		color("LightGrey",0.5) cube([roomWidth, roomLength, 2100], center = false);
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
}

module workbench() {
	translate([0, 0, wbH]) {
		color("BurlyWood", 1.0) cube([wbLength - 300, wbWidth, wbHeight]);
	}

	translate([0, wbWidth, wbH]) {
		color("BurlyWood", 1.0) cube([wbWidth, wbLength - 895, wbHeight]);
	}
}

module bottom_cabins() {	
	translate([0, 0, 100]) {
		color("white", 1.0) cube([wbLength - 300, 435, cbH]);
	}

	// Sockel
	translate([0, 0, 0]) {
		color("lightgrey", 1.0) cube([wbLength - 300, 430, 100]);
	}

	translate([0, 435, 100]) {
		color("white", 1.0) cube([435, wbLength - 460, cbH]);
	}

	// Sockel
	translate([0, 435, 0]) {
		color("lightgrey", 1.0) cube([430, wbLength - 460, 100]);
	}
}

module top_cabins() {	
	translate([0, 0, 1600]) {
		color("white", 1.0) cube([wbLength - 300, 435, tcbH]);
	}

	translate([0, 435, 1600]) {
		color("white", 1.0) cube([435, wbLength - 460, tcbH]);
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

room();
desk();
translate([2000, 3700,0]) legs();
translate([2000, 2000,0]) legs();
translate([200, 2000,0]) legs();
translate([200, 3700,0]) legs();
bottom_cabins();
top_cabins();
workbench();


