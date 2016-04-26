ArrayList<LightWave> waves;
ArrayList<Photon> photons;
Wall wall;
LightSource light;
int endWallX;

void setup() {
    size(600, 400, P2D);
    init();
}

void init() {
    waves = new ArrayList<LightWave>();
    photons = new ArrayList<Photon>();
    light = new LightSource();
    wall = new Wall(new PVector(width * 2 / 8, 0), 100);
    endWallX = width * 7 / 8;
}

void draw() {
    background(0);

    for (int ndx = 0; ndx < waves.size(); ndx++) {
        LightWave wave = waves.get(ndx);
        if (!wave.render())
            waves.remove(ndx--) ;
    }

    for (int ndx = 0; ndx < photons.size(); ndx++) {
        Photon phot = photons.get(ndx) ;
        if (!phot.render())
            photons.remove(ndx--);
    }
    if (photons.size() > 1000)
        photons.remove(0);

    wall.render();
    light.render();

    fill(128);
    rect(endWallX, 0, width * 1 / 8, height);
}

boolean offScreen(PVector pos) {
    return pos.x < -15 || pos.x > width + 15
        || pos.y < -15 || pos.y > height + 15;
}


void addWave() {
    waves.add(new LightWave());
}

void addWave(PVector wavePos, float sign) {
    waves.add(new LightWave(wavePos, sign));
}

void addPhoton() {
    photons.add(new Photon());
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

void mousePressed() {
    light.toggleEmission();
}
