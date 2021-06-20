//
//  ContentView.swift
//  GeometryReaderPractice
//
//  Created by Frederick Javalera on 6/19/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color.red
        .ignoresSafeArea()
      
      // Takes on the height of the ZStack on line 12.
      GeometryReader { geo in
        VStack(spacing:0) {
          ZStack {
            Rectangle()
              .frame(width: geo.size.width, height: geo.size.height/3)
              .foregroundColor(Color.blue)
            // Takes on the height of the ZStack on line 19.
            GeometryReader { geo2 in
              VStack {
                Text("Top Left Text")
                  .font(.headline)
                Text("Bottom Trailing")
                  .font(.subheadline)
              }
              .frame(width: geo2.size.width * 0.5, height: geo2.size.height * 0.5, alignment: .bottomTrailing)
              .background(Color.yellow)
              labelAndTitle
                .padding(.horizontal)
                .frame(width: geo2.size.width, height: geo2.size.height, alignment: .bottomTrailing)
                .offset(CGSize(width: geo2.size.width * -0.27, height: geo2.size.height * -0.25))
            }
          }
          Rectangle()
            .frame(width: geo.size.width, height: geo.size.height/3)
            .foregroundColor(Color.green)
          Rectangle()
            .frame(width: geo.size.width, height: geo.size.height/3)
            .foregroundColor(Color.pink)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

extension ContentView {
  private var labelAndTitle: some View {
    VStack {
      Label("Heart", systemImage: "heart.fill")
      Text("Offset Text")
        .font(.largeTitle)
    }
  }
}
