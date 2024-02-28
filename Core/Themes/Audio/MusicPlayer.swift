import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var bgmPlayer: AVAudioPlayer?
    var effectPlayer: AVAudioPlayer?
    
    func playBackgroundMusic(backgroundMusicFileName: String, format: String, vol: Float) {
        guard let url = Bundle.main.url(forResource: backgroundMusicFileName, withExtension: format) else { return }
        do {
            bgmPlayer = try AVAudioPlayer(contentsOf: url)
            bgmPlayer?.numberOfLoops = -1
            bgmPlayer?.volume = vol
            bgmPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopBackgroundMusic() {
        guard let bgmPlayer = bgmPlayer else { return }
        bgmPlayer.stop()
    }
    
    func playSoundEffect(soundEffectFileName: String, format: String, vol: Float) {
        guard let url = Bundle.main.url(forResource: soundEffectFileName, withExtension: format) else { return }
        do {
            effectPlayer = try AVAudioPlayer(contentsOf: url)
            effectPlayer?.volume = vol
            effectPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
