import SwiftUI

struct CoffeeItemView: View {
    // このViewを構成している要素を宣言
    let coffee = Coffee(
        id: 1,
        title: "Black Coffee",
        description: "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
        ingredients: ["Coffee"],
        image: URL(string: "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
    )

    // お気に入り情報は状態が変わるため、@Stateのおまじない
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
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
            .contentShape(.rect)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(coffee.title)
                        .font(.title)
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
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
            .foregroundStyle(.white)
            .padding()
            .background(Color.black.opacity(0.5))
            .background(.ultraThinMaterial)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CoffeeItemView()
        .padding()
}
