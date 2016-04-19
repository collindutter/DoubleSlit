public class Wall {
    ArrayList<WallPiece> pieces;

    public Wall(PVector p, int h, int slitGap) {
        pos = p; 
        wallHeight = h;
        wallWidth = 20;
        pieces = new ArrayList<WallPiece>();
        pieces.add(new WallPiece(height / 2 - gap - gap /2));
        pieces.add(new WallPiece(height / 2 - gap / 2), gap);
        pieces.add(new WallPiece(height /2 + gap + gap / 2), height / 2 - gap + gap / 2);
    }

    public void render() {
        for (WallPiece piece : pieces)
            piece.render();
    }

    public int getWidth() {
        return wallWidth;
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
