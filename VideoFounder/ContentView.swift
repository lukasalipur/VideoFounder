//
//  ContentView.swift
//  VideoFounder
//
//  Created by Luka Šalipur on 7.8.22..
//

import SwiftUI

struct ContentView: View {
//    @State private var isTapped = false
    
 
    @StateObject var network = Network()
    var twoColumns = [GridItem(.flexible(), spacing:-60),
                      GridItem(.flexible(), spacing:-60),
    ]
    


   
    var body: some View {
        NavigationView{
        ScrollView{
            
            VStack{
                HStack {
                    ForEach(Query.allCases, id:\.self){
                        searchQuery in
                        
                        TagView(query: searchQuery, isSelected: network.selectedQuery == searchQuery).onTapGesture {
                            network.selectedQuery = searchQuery
                        }
                    }
                }
            }
            
            LazyVGrid(columns:twoColumns, spacing:16){
                
               
                
                ForEach(network.videos, id: \.id){ sVideo in
                    
                    NavigationLink{
                        
                       
                        VideoPreview(video:sVideo)

                   

                        
                    } label: {
                        VideoCard(video: sVideo)
                    }
                    
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                    }
            }
            
            //        .overlay(content: {
            //            if isTapped {
            //                VideoPreview(video: sVideo)
            //            }
            //            })
        
 
  
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
