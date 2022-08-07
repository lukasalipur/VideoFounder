//
//  VideoPreview.swift
//  VideoFounder
//
//  Created by Luka Šalipur on 7.8.22..
//

import SwiftUI
import AVKit

struct VideoPreview: View {
    var video: Video
    @State private var player = AVPlayer()



     var body: some View {
         ZStack{
         VideoPlayer(player: player).onDisappear(perform: {
             player.pause()
         })
             .onAppear {

                 if let link = video.videoFiles.first?.link {
                     player = AVPlayer(url: URL(string: link)!)
                     player.play()
                 }
             }
             .ignoresSafeArea()
             .frame(maxWidth:.infinity, maxHeight:.infinity)
         }
     }
 
}

struct VideoPreview_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreview(video: previewVideo)
    }
}
