public class Wall {
    private ArrayList<WallPiece> pieces;
    private int wallHeight, wallWidth;
    private PVector pos;
    private int topSlit, botSlit;
    private int slitDiff;

    public Wall(PVector p, int sd) {
        pos = p; 
        slitDiff = sd;
        wallHeight = height;
        wallWidth = 20;
        int gapSize = 25;
        pieces = new ArrayList<WallPiece>();
        int midStart = height / 2 - slitDiff / 2 + gapSize / 2;
        int midEnd = midStart + slitDiff - gapSize;
        topSlit = midStart - gapSize / 2;
        botSlit = midEnd + gapSize / 2;

        pieces.add(new WallPiece(0, midStart - gapSize));
        pieces.add(new WallPiece(midStart, slitDiff - gapSize));
        pieces.add(new WallPiece(midEnd + gapSize, height - midEnd - gapSize));
    }

    public void render() {
        for (WallPiece piece : pieces)
            piece.render();
    }

    public int getWidth() {
        return wallWidth;
    }

    public int topSlit() {
        return topSlit;
    }

    public int botSlit() {
        return botSlit;
    }

    public int slitDiff() {
        return slitDiff;
    }

    public PVector pos() {
        return pos.copy();
    }

    private class WallPiece {
        public PVector pos;
        public int pieceHeight;
        public int pieceWidth;

        public WallPiece(int y, int pHeight) {
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
