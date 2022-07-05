import SwiftUI

struct CollectionCellView: View {

    private let numberInRow: Int
    private let imageURL: String?
    private let ingredientName: String

    init(numberInRow: Int, imageURL: String?, ingredientName: String){
        self.numberInRow = numberInRow
        self.imageURL = imageURL
        self.ingredientName = ingredientName
    }

    var body: some View {
        VStack{
            AsyncImage(
                url: URL(string: imageURL ?? ""),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 140, maxHeight: 140)
                        .cornerRadius(8)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(ingredientName)
                .lineLimit(1)
        }
        .frame(width: 170, height: numberInRow % 2 == 0 ? 190 : 220)
        .background(.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
        .shadow(radius: 12)
    }
}

struct CollectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCellView(
            numberInRow: 2,
            imageURL: """
                https://img.restoclub.ru/uploads/place
                           /c/6/7/0/c670f
                           3405f20b2c8513908b467548849_w958_h835--big.jpg
                """,
            ingredientName: "Vodka"
        )
    }
}
