public class LightWave {
    private PVector pos;
    private PVector vel;
    private float waveMag;
    private float waveWidth;
    private float rot;

    public LightWave(PVector p) {
        pos = p;
        vel = new PVector(2 * cos(0), sin(0));
        waveMag = 50;
        waveWidth = 25;
        rot = 0;
    }

    public LightWave(PVector p, float r) {
        pos = p;
        vel = new PVector(2 * cos(r), sin(r));
        waveMag = 50;
        waveWidth = 25;
        rot = r;
    }
    
    public boolean render() {
        pos.add(vel);
        drawWave();
        waveMag += 4; 
        waveWidth += 2;
        if (collidesWithWall(new PVector(pos.x + waveWidth / 2, pos.y)))
            return false;
        if (pos.x > width)
            return false;
        return true;
    }

    private void drawWave() {
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(rot);
        translate(-pos.x, -pos.y);
        noFill();
        stroke(#ffff00);
        arc(pos.x, pos.y, waveWidth, waveMag, -HALF_PI + PI / 6, HALF_PI - PI / 6);
        popMatrix();
    }
}
