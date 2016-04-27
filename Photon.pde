public class Photon {
    private PVector pos;
    private PVector vel;
    private int radius;
    private boolean hitWall;
    private boolean passWall;

    public Photon() {
        vel = new PVector(random(2, 3), random(-2, 2));
        pos = new PVector(15, height / 2);
        radius = 3;
        hitWall = false;
        passWall = false;
    }

    public boolean render() {
        pos.add(vel);
        drawPhoton();
        if (collideWithWall()) {
            vel.x = -vel.x;
        }

        if (!passWall && pos.x + radius >= endWallX) {
            vel.x = 0;
            vel.y = 0;
            hitWall = true;
        }
        if (offScreen(pos.copy()))
            return false;
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
    
    public boolean hitWall() {
        return hitWall;
    }

    public void setWallPass() {
        passWall = true;
    }
}
