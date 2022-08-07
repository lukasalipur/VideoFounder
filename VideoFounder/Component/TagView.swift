//
//  TagView.swift
//  VideoFounder
//
//  Created by Luka Šalipur on 7.8.22..
//

import SwiftUI




struct TagView: View {
    var query:Query
    var isSelected:Bool
       
       var body: some View {
           Text(query.rawValue)
               .font(.caption)
               .bold()
               .foregroundColor(isSelected ? .black : .gray)
               .padding(10)
               .background(.thinMaterial)
               .cornerRadius(10)
        }
    }


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(query: Query.nature, isSelected: true)
    }
}
