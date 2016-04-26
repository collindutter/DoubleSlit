public class LightSource {
    private boolean firePhoton;
    public LightSource() {
        firePhoton = false;
    }

    public boolean render() {
        if (firePhoton) {
            if (frameCount % 1 == 0)
                addPhoton();
        }
        else {
            if (frameCount % 10 == 0)
                addWave();
        }
        return true;
    }

    public void toggleEmission() {
        for (int ndx = 0; ndx < photons.size(); ndx++)
            if (photons.get(ndx).hitWall)
                photons.remove(ndx--);
            else
                photons.get(ndx).setWallPass();
        firePhoton = !firePhoton;
    }
}
