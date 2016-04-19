ArrayList<LightWave> waves;
ArrayList<Wall> walls;
LightSource light;

void setup() {
    size(600, 400, P2D);
    init();
}

void init() {
    waves = new ArrayList<LightWave>();
    walls = new ArrayList<Wall>();
    light = new LightSource();

    walls.add(new Wall(new PVector(width / 3, 0), height / 2 - 75));
    walls.add(new Wall(new PVector(width / 3, height / 2 - 25), 50));
    walls.add(new Wall(new PVector(width / 3, height /2 + 75), height / 2 - 75));
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

    for (Wall wall : walls) {
        wall.render();
    }
    light.render();
}


void addWave() {
    waves.add(new LightWave());
}
