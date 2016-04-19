public class LightSource {
    public LightSource() {
    }

    public boolean render() {
        if (frameCount % 10 == 0)
            addWave();
        return true;
    }
}
