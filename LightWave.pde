public class LightWave {
    private PVector pos;
    private PVector vel;
    private float waveMag;
    private float waveWidth;

    public LightWave() {
        pos = new PVector(0, height / 2);
        vel = new PVector(2, 0);
        waveMag = 50;
        waveWidth = 25;
    }

    public boolean render() {
        pos.add(vel);
        drawWave();
        waveMag += .5;
        waveWidth += .25;
        if (pos.x > width)
            return false;
        return true;
    }

    private void drawWave() {
        noFill();
        stroke(#ffff00);
        arc(pos.x, pos.y, waveWidth, waveMag, -HALF_PI + PI / 6, HALF_PI - PI / 6);
    }

}
