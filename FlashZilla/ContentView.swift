//
//  ContentView.swift
//  FlashZilla
//
//  Created by Yash Poojary on 07/12/21.
//

import SwiftUI


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}


struct ContentView: View {
    
    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    
    var body: some View {
        ZStack {
            
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: cards.count)
                            
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle Tapped")
//                }
//
//            Circle()
//                .fill(Color.red)
//                .frame(width: 300, height: 300)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle Tapped")
//                }
//
//        }
//    }
//}

//struct ContentView: View {
//
//    @State private var engine: CHHapticEngine?
//
//
//    var body: some View {
//        Text("Hello World!")
//            .onAppear(perform: prepareHaptics)
//            .onTapGesture(perform: complexSuccess)
//    }
//
//    func simpleSuccess() {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
//    }
//
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//
//        do {
//
//            engine = try CHHapticEngine()
//            try engine?.start()
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func complexSuccess() {
//
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//
//        var events = [CHHapticEvent]()
//
//
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
//
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            events.append(event)
//        }
//
//
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//            events.append(event)
//        }
//
//
//
//
//
//
//
//        do {
//
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription)")
//        }
//
//
//
//    }
//}
// struct ContentView: View {
//
//    @State private var offset = CGSize.zero
//    @State private var isDragging = false
//
//
//    var body: some View {
//
//        let dragGesture = DragGesture().onChanged { value in
//            offset = value.translation
//        }
//            .onEnded { _ in
//                withAnimation {
//                    offset = .zero
//                    isDragging = false
//                }
//            }
//
//        let pressGesture = LongPressGesture().onEnded { _ in
//            withAnimation {
//                isDragging = true
//            }
//
//        }
//
//        let combined = pressGesture.sequenced(before: dragGesture)
//
//
//        return Circle()
//            .fill(Color.red)
//            .frame(width: 64, height: 64)
//            .scaleEffect(isDragging ? 1.5 : 1)
//            .offset(offset)
//            .gesture(combined)
//
//    }
//}

// struct ContentView: View {
//
//    var body: some View {
//        VStack {
//            Text("Hello World")
//                .onTapGesture {
//                    print("Text Tapped")
//                }
//        }
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded { _ in
//                    print("VStack Tapped")
//                }
//
//        )
//
//    }
//}
