ArrayList<LightWave> waves;
Wall wall;
LightSource light;

void setup() {
    size(600, 400, P2D);
    init();
}

void init() {
    waves = new ArrayList<LightWave>();
    light = new LightSource();
    wall = new Wall(new PVector(width / 3, 0), 100);
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

    fill(255);
    line(width / 3, height / 2 - 20, width, height / 4);
    fill(128);
    rect(width * 7 / 8, 0, width * 1 / 8, height);
}

void addWave(PVector wavePos) {
    waves.add(new LightWave(wavePos));
}

void addWave(PVector wavePos, float rot) {
    waves.add(new LightWave(wavePos, rot));
}

boolean collidesWithWall(PVector pos) {
    if (pos.x >= wall.pos().x + wall.getWidth() &&
            pos.x < wall.pos().x + wall.getWidth() + 3) {
        addWave(new PVector(wall.pos().x + wall.getWidth() + 3, wall.botSlit()), -PI / 12);
        addWave(new PVector(wall.pos().x + wall.getWidth() + 3, wall.topSlit()), PI / 12);
        return true;
    }
    return false;
}
