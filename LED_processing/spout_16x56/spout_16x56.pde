// swaeg 16 putkea spoutilla touchista.

import java.awt.*; // needed for frame insets
Insets insets; // Frame caption and borders for resizing
PImage img;
OPC opc;

// DECLARE A SPOUT OBJECT HERE
Spout spout;

void setup() {

  size(560, 160, P3D);     // ikkunan koko
  frame.setResizable(true); // Optionally adapt to sender frame size
  insets = frame.getInsets(); // Get the caption and borders for frame resizing
  background(0);

  // Create an image to receive the data.
  //img = createImage(width, height, ARGB);
  // Is it because of the alpha channel up there, that the patch goes into feedback??
  img = createImage(width, height, RGB);

  // CREATE A NEW SPOUT OBJECT HERE
  spout = new Spout();

  // INITIALIZE A SPOUT RECEIVER HERE
  // Give it the name of the sender you want to connect to
  // Otherwise it will connect to the active sender
  // img will be updated to the sender size
  //spout.initReceiver("led", img);
  spout.initReceiver("", img);
   opc = new OPC(this, "192.168.1.100", 7890);

// putki1
opc.ledStrip(0, 56, width/2 + 460, 8, width / 70.0, 0, false);
// putki2
opc.ledStrip(56, 56, width/2 + 380, 16, width / 70.0, 0, false);
// putki3
opc.ledStrip(112, 56, width/2 + 300, 24, width / 70.0, 0, false);
// putki4
opc.ledStrip(168, 56, width/2 + 220, 32, width / 70.0, 0, false);
// putki5
opc.ledStrip(224, 56, width/2 + 140, 40, width / 70.0, 0, false);
// putki6
opc.ledStrip(280, 56, width/2 + 60, 48, width / 70.0, 0, false);
// putki7
opc.ledStrip(336, 56, width/2 - 20, 56, width / 70.0, 0, false);
// putki8
opc.ledStrip(392, 56, width/2 - 100, 64, width / 70.0, 0, false);
// putki9
opc.ledStrip(448, 56, width/2 - 180, 72, width / 70.0, 0, false);
// putki10
opc.ledStrip(504, 56, width/2 - 260, 80, width / 70.0, 0, false);
// putki11
opc.ledStrip(560, 56, width/2 - 340, 88, width / 70.0, 0, false);
// putki12
opc.ledStrip(616, 56, width/2 - 420, 96, width / 70.0, 0, false);
// putki13
opc.ledStrip(672, 56, width/2 - 500, 104, width / 70.0, 0, false);
// putki14
opc.ledStrip(728, 56, width/2 - 580, 112, width / 70.0, 0, false);
// putki15
opc.ledStrip(784, 56, width/2 - 660, 120, width / 70.0, 0, false);
// putki16
opc.ledStrip(840, 56, width/2 - 740, 128, width / 70.0, 0, false);

}


void draw() {

  // RECEIVE A SHARED TEXTURE HERE
  img = spout.receiveTexture(img);
  //background(0);
  // Draw the result
  image(img, 0, 0, width, height);
}

 // Connect to the local instance of fcserver ?? oisko taa joku wanha kommentti

// RH click to select a sender
void mousePressed() {
  // SELECT A SPOUT SENDER HERE
  if (mouseButton == RIGHT) {
    // Bring up a dialog to select a sender from
    // the list of all senders running.
    JSpout.SenderDialog();
  }
}

// over-ride exit to release sharing
void exit() {
  // CLOSE THE SPOUT RECEIVER HERE
  spout.closeReceiver();
  super.exit();
}
