public class Wall {
    private PVector pos;
    private int wallHeight;

    public Wall(PVector p, int h) {
        pos = p; 
        wallHeight = h;
    }

    public void render() {
        fill(#a6a6a6);
        stroke(#a6a6a6);
        rect(pos.x, pos.y, 20, wallHeight);
    }
}
