ArrayList<LightWave> waves;
Wall wall;
LightSource light;
int endWallX;

void setup() {
    size(600, 400, P2D);
    init();
}

void init() {
    waves = new ArrayList<LightWave>();
    light = new LightSource();
    wall = new Wall(new PVector(width * 2 / 8, 0), 100);
    endWallX = width * 7 / 8;
}

void draw() {
    background(0);

    for (int ndx = 0; ndx < waves.size(); ndx++) {
        LightWave wave = waves.get(ndx);
        if (!wave.render()) {
            waves.remove(ndx) ;
            ndx--;
        }
    }
    wall.render();
    light.render();

    fill(128);
    rect(endWallX, 0, width * 1 / 8, height);
}

void addWave() {
    waves.add(new LightWave());
}

void addWave(PVector wavePos, float sign) {
    waves.add(new LightWave(wavePos, sign));
}

boolean collidesWithWall(LightWave w) {
    if (w.fancy)
        return false;
    if (w.pos.x + w.waveWidth / 2 >= wall.pos().x + wall.getWidth() / 2 && w.pos.x < wall.pos().x + wall.getWidth() / 2) {
        addWave(new PVector(wall.pos().x, wall.botSlit()), -1.0);
        addWave(new PVector(wall.pos().x, wall.topSlit()), 1.0);
        return true;
    }
    return false;
}
