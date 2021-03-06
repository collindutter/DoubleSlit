public class Wall {
    private ArrayList<WallPiece> pieces;
    private int wallHeight, wallWidth;
    private PVector pos;
    private float topSlit, botSlit;
    private float slitDiff;
    private float gapSize;

    public Wall(PVector p, float sd) {
        pos = p; 
        slitDiff = sd;
        wallHeight = height;
        wallWidth = 20;
        pieces = new ArrayList<WallPiece>();

        gapSize = 50;
        float midStart = (height / 2.0) - (slitDiff / 2.0) + (gapSize / 2.0);
        float midEnd = midStart + slitDiff - gapSize;
        topSlit = midStart - gapSize / 2.0;
        botSlit = midEnd + gapSize / 2.0;

        pieces.add(new WallPiece(0, midStart - gapSize)); // top
        pieces.add(new WallPiece(midStart, slitDiff - gapSize)); // mid
        pieces.add(new WallPiece(midEnd + gapSize, height - midEnd - gapSize)); // bot
    }

    public void render() {
        fill(#ff0000);
        for (WallPiece piece : pieces)
            piece.render();
    }

    public float getWidth() {
        return wallWidth;
    }

    public float topSlit() {
        return topSlit;
    }

    public float botSlit() {
        return botSlit;
    }

    public float slitDiff() {
        return slitDiff;
    }

    public PVector pos() {
        return pos.copy();
    }
    
    public boolean inSlit(PVector pos) {
        float halfGap = gapSize / 2.0;
        return (pos.y > topSlit - halfGap && pos.y < topSlit + halfGap) ||
            (pos.y > botSlit - halfGap && pos.y < botSlit + halfGap);
    }

    private class WallPiece {
        public PVector pos;
        public float pieceHeight;
        public float pieceWidth;

        public WallPiece(float y, float pHeight) {
            pos = new PVector(Wall.this.pos.x, y);
            pieceWidth = Wall.this.wallWidth;
            pieceHeight = pHeight;
        }

        public void render() {
            fill(#a6a6a6);
            stroke(#a6a6a6);
            rect(pos.x, pos.y, pieceWidth, pieceHeight);
        }
    }
}
