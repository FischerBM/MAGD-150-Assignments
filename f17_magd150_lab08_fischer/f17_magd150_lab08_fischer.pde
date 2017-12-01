import processing.pdf.*;
PImage img;
PFont Arial;
PFont b;
PFont Heading;
int ind = 0;

float x;

String[] update = {
  "Coming Soon!!!",
  "THE FIRE FADES QUICKLY!!!"
};

String[] title = {
  "SOULS -The Twin Princes"
};
void setup() {
 size (600, 600);
 beginRecord(PDF, "f17_magd_lab08_fischer.pdf");
  Arial = loadFont ("Arial-BoldMT-48.vlw");
 //font to go in the center of the poster
 textAlign(CENTER);
 textSize (44);
 
 // font for bottom
 b= createFont("Broadway", 22); // messed it up.
 x = width;
 
 //top
 Heading = createFont ("MicrosoftSansSerif", 48);
 // would probably mess it up too in my case ^.
 
}

void draw() {
  // image for poster, used as background
 //background(img); //tried this
 image(img, 0, 0); // originally worked
 img.resize(600, 600);
 // stuff for center of the poster
 pushMatrix();
 fill(255,38,50,225);
 text("... Rise if you would", 300, 250);
 text("For that is our", 240, 320);
 fill (0);
 text("Curse ...", 490, 320, 44);
 popMatrix();
 
 // bottom text stuff
 fill(255, 50, 50);
 textFont(b, 22);
 textAlign (LEFT);
 text(update[ind], x, height -38);
 
 x = x - 2;
 float y = textWidth(update[ind]);
 if (x < -y) {
   x = width;
   ind = (ind + 1) % update.length;
 }
 
 fill (0);
 textFont(Heading, 48);
 textAlign (TOP, CENTER);
 text (title[ind], x, height +38);
 
 endRecord();
}