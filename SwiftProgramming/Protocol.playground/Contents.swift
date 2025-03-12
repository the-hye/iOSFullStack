import Foundation

protocol SampleProtocol {
    var name: String { get set }
    var description: String { get }
}

struct SampleProject: SampleProtocol {
    var name = "홍길동"
    var description: String {
        return "Name: \(self.name)"
    }
}

var sample = SampleProject(name: "지혜")
print(sample.description)

protocol SampleMethodProtocol {
    func execute(cmd: String)
    func showPort(port: Int) -> String
}

struct Process: SampleMethodProtocol {
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다.")
        }
    }
    
    func showPort(port: Int) -> String {
        return "Port: \(port)"
    }
}

protocol Player {
    var playTime: Int { get set }
    func play()
    func pause()
    func next()
    func previous()
}

class AudioPlayer: Player {
    var playTime: Int = 0
    
    func play() {
        print("노래 재생")
    }
    
    func pause() {
        print("노래 일시정지")
    }
    
    func next() {
        print("다음 노래")
    }
    
    func previous() {
        print("이전 노래")
    }
    
    
}

class VideoPlayer: Player {
    var playTime: Int = 0
    
    func play() {
        print("동영상 재생")
    }
    
    func pause() {
        print("동영상 일시정지")
    }
    
    func next() {
        print("다음 동영상")
    }
    
    func previous() {
        print("이전 동영상")
    }
}

class MediaPlayer {
    var player: Player
    
    init(player: Player) {
        self.player = player
    }
}

let audioPlayer = AudioPlayer()
let videoPlayer = VideoPlayer()
let mediaPlayer = MediaPlayer(player: audioPlayer)
mediaPlayer.player.play()
mediaPlayer.player.pause()

let mediaPlayer1 = MediaPlayer(player: videoPlayer)
mediaPlayer1.player.play()
mediaPlayer1.player.next()
