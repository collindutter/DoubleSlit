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

void addWave(PVector wavePos, int sign) {
    waves.add(new LightWave(wavePos, sign));
}

boolean collidesWithWall(PVector pos) {
    if (pos.x >= wall.pos().x + wall.getWidth() &&
            pos.x < wall.pos().x + wall.getWidth() + 3) {
        addWave(new PVector(wall.pos().x + wall.getWidth() + 3, wall.botSlit()), -1);
        addWave(new PVector(wall.pos().x + wall.getWidth() + 3, wall.topSlit()), 1);
        return true;
    }
    return false;
}
