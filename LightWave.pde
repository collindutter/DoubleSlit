public class LightWave {
    private PVector pos;
    private PVector vel;
    private float waveMag;
    private float waveWidth;
    private float rot;
    private final int SPEED = 2;
    public boolean fancy;
    private boolean collided;
    public boolean lastWave;

    public LightWave() {
        pos = new PVector(15, height / 2);
        vel = new PVector(SPEED, 0);
        waveMag = 50;
        waveWidth = 25;
        rot = 0;
        fancy = false;
        collided = false;
        lastWave = false;
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
        if (collidesWithWall(this))
            return false;
        if (pos.x + waveWidth / 2 > endWallX && !collided) {
            lightMiddle = true;
            collided = true;
        }
        if (pos.x > endWallX) {
            return false;
        }

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
