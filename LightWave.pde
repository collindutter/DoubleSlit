public class LightWave {
    private PVector pos;
    private PVector vel;
    private float waveMag;
    private float waveWidth;
    private float rot;

    public LightWave() {
        pos = new PVector(0, height / 2);
        vel = new PVector(2, 0);
        waveMag = 50;
        waveWidth = 25;
        rot = 0;
    }

    public LightWave(PVector p, int sign) {
        pos = p;
        waveMag = 50;
        waveWidth = 25;

        float x = endWallX - wall.pos().x + wall.getWidth() / 2;
        float dy = (50 * x)/ wall.slitDiff();
        rot = sign * atan2(dy, x);

        vel = new PVector(cos(rot), sign * sin(rot));
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
