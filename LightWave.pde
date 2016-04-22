public class LightWave {
    private PVector pos;
    private PVector vel;
    private float waveMag;
    private float waveWidth;
    private float rot;
    private final int SPEED = 2;
    public boolean fancy;

    public LightWave() {
        pos = new PVector(0, height / 2);
        vel = new PVector(SPEED, 0);
        waveMag = 50;
        waveWidth = 25;
        rot = 0;
        fancy = false;
    }

    public LightWave(PVector p, float sign) {
        pos = p;
        waveMag = 50;
        waveWidth = 25;

        float x = endWallX - (wall.pos().x + wall.getWidth() / 2.0);
        float dy = (sign * 1 * x)/ wall.slitDiff();
        rot = atan2(dy, x);

        vel = new PVector(SPEED * cos(rot), SPEED * sin(rot));
        fancy = true;
    }
    
    public boolean render() {
        pos.add(vel);
        drawWave();
        waveMag += 4; 
        waveWidth += 2;
        if (collidesWithWall(this))//new PVector(pos.x + waveWidth / 2, pos.y)))
            return false;
        if (offScreen(pos.copy()))
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
