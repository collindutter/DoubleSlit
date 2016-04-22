public class Photon {
    private PVector pos;
    private PVector vel;
    private int radius;

    public Photon() {
        vel = new PVector(random(2, 3), random(-2, 2));
        pos = new PVector(0, height / 2);
        radius = 3;
    }

    public boolean render() {
        pos.add(vel);
        drawPhoton();
        if (collideWithWall()) {
            vel.x = -vel.x;
        }

        if (pos.x + radius >= endWallX) {
            vel.x = 0;
            vel.y = 0;
        }
        return true;
    }

    private boolean collideWithWall() {
        if (pos.x >= wall.pos().x) 
            if (pos.x < wall.pos().x + wall.getWidth())
                if (!wall.inSlit(pos))
                    return true;
        return false;
    } 

    public void drawPhoton() {
        fill(#ffff00);

        noStroke();
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
    }
}
