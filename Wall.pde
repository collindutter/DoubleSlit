public class Wall {
    private PVector pos;
    private int wallHeight;
    private int wallWidth;

    public Wall(PVector p, int h) {
        pos = p; 
        wallHeight = h;
        wallWidth = 20;
    }

    public void render() {
        fill(#a6a6a6);
        stroke(#a6a6a6);
        rect(pos.x, pos.y, wallWidth, wallHeight);
    }

    public int getWidth() {
        return wallWidth;
    }

    public PVector pos() {
        return pos.copy();
    }

    private class WallPiece {
        public WallPiece() {
        }
    }
}
