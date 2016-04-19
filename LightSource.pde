public class LightSource {
    public LightSource() {
    }

    public boolean render() {
        if (frameCount % 10 == 0)
            addWave(new PVector(0, height / 2));
        return true;
    }
}
