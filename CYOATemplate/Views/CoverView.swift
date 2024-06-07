//
//  CoverView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct CoverView: View {
    
    // MARK: Stored properties
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    @State private var bgColor = Color.white
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            if book.isNotReadyToRead {
                
                ProgressView()
                
            } else {
                
                // Show the cover
                Text("Journey Under the Sea")
                    .font(.largeTitle)
                
                
                Button {
                    // Animate page changes (fade)
                    withAnimation {
                        book.beginReading()
                    }
                } label: {
                    Text("Begin reading")
                }
                .buttonStyle(.borderedProminent)
            }
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(bgColor)

        .padding()
        
    }
}

#Preview {
    CoverView()
}
