//
//  ShopView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 14/4/21.
//

import SwiftUI
import MapKit

struct ShopView: View {
    
    @StateObject var shopStore = ShopStore()
    @StateObject var locationFetcher = LocationFetcher()
    @State private var showBottomCard : Bool = false
    @State private var showFullBottomCard : Bool = false
    @State private var bottomCardPosition : CGSize = CGSize.zero
    @State private var selectedShop : Shop? = nil
    
    var body: some View {
        ZStack {
            map
            
            actionButton
            
            bottomCard
        }
        .onAppear {
            self.locationFetcher.getUserPosition()
        }
    }
    
    var map : some View {
        Map(coordinateRegion: $locationFetcher.region, showsUserLocation: true, annotationItems: shopStore.shops) { shop in
            MapAnnotation(coordinate: shop.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                Image("LogoIllustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .background(Color("Brownie Dark"))
                    .clipShape(Circle())
                    .onTapGesture {
                        withAnimation {
                            self.locationFetcher.region = MKCoordinateRegion(center: shop.coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
                            self.showBottomCard = true
                            self.selectedShop = shop
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
    
    var actionButton : some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.locationFetcher.getUserPosition()
                }, label: {
                    Image(systemName: "location.fill")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .frame(width: 38, height: 38)
                        .background(Color.white)
                        .clipShape(Circle())
                })
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
    var bottomCard : some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 6, alignment: .center)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("Come find us in our coffee stores all around the world and try our amazing products")
                .font(.subheadline)
                .lineSpacing(4)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .top, spacing: 20.0) {
                
                Image("LogoIllustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .padding(10)
                    .background(Color("Brownie Dark"))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(self.selectedShop?.title ?? "")
                        .fontWeight(.bold)
                    
                    Text(self.selectedShop?.address ?? "")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                    HStack {
                        ForEach(0 ..< 5) { item in
                            Image(systemName: "star.fill")
                                .font(.headline)
                                .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                        }
                    }
                }
            }

            .frame(maxWidth: .infinity)
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(VisualEffectBlur(blurStyle: .systemThinMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: self.showBottomCard ? 400 : UIScreen.main.bounds.height)
        .offset(y: self.bottomCardPosition.height)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .gesture(
            DragGesture()
                .onChanged({ (value) in
                    self.bottomCardPosition = value.translation
                    if self.showFullBottomCard {
                        self.bottomCardPosition.height += -300
                    }
                    if self.bottomCardPosition.height < -300 {
                        self.bottomCardPosition.height = -300
                    }
                })
                .onEnded({ (value) in
                    if self.bottomCardPosition.height > 70 {
                        self.showBottomCard = false
                    }
                    if self.bottomCardPosition.height < -100 {
                        self.bottomCardPosition.height = -300
                        self.showFullBottomCard = true
                    } else {
                        self.showFullBottomCard = false
                        self.bottomCardPosition = .zero
                    }
                })
        )
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
