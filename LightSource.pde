public class LightSource {
    public LightSource() {
    }

    public boolean render() {
        if (frameCount % 1 == 0) {
            addPhoton();
            //addWave();
        }
        return true;
    }
}
