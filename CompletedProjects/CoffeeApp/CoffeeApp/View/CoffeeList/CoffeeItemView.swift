//
//  CoffeeItemView.swift
//  CoffeeApp
//
//  CompletedProjects
//

import SwiftUI

struct CoffeeItemView: View {
    let coffee: Coffee
    @State var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: coffee.image) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(coffee.title)
                        .font(.title)
                    Spacer()
                    Button(action: {
                        markAsFavorite()
                    }) {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                    }
                    
                }
                Text(coffee.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                HStack {
                    ForEach(coffee.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.5))
            .background(.ultraThinMaterial)
        }
        .cornerRadius(10)
    }
    
    func markAsFavorite() {
        isFavorite.toggle()
        // TODO: お気に入り状態をUserDefault（ローカルDB）に保存する
    }
}

#Preview {
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )

    CoffeeItemView(coffee: coffee)
        .padding()
}
