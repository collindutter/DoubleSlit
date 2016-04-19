public class LightSource {
    public LightSource() {
    }

    public boolean render() {
        if (frameCount % 60 == 0) {
            addWave();
        }
        return true;
    }
}
