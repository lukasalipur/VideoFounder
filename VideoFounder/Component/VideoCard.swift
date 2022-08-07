//
//  VideoCard.swift
//  VideoFounder
//
//  Created by Luka Šalipur on 7.8.22..
//

import SwiftUI

struct VideoCard: View {
    var video:Video
//    @Binding var isTapped:Bool
    var body: some View {
        ZStack{
        ZStack{
            AsyncImage(url: URL(string: video.image)) {   image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 250)
                    .cornerRadius(25)
            }
            placeholder: {
        Rectangle()
            .foregroundColor(.gray
            .opacity(0.3))
            .frame(width: 160, height: 250)
            .cornerRadius(30)
            }
        }
    
            VStack{
                Image(systemName:"play.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size:50))
            }
            
            VStack{
                Spacer()
                Text("\(video.duration) s").foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(width:170, height:250, alignment: .leading)
              
        }
//        .onTapGesture {
//            self.isTapped = true
//        }
      
    }
}
