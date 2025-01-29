import SwiftUI

struct InputSearch: View {
    @State private var tags: [String] = ["tag1", "tag2", "tag3"]
    @State private var newTag: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // TextField sa tagovima
            VStack {
                HStack {
                    // Prikaz postojećih tagova
                    ForEach(tags, id: \.self) { tag in
                        HStack {
                            Text(tag)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .overlay(
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                        .padding(.leading, 4)
                                        .onTapGesture {
                                            removeTag(tag)
                                        },
                                    alignment: .trailing
                                )
                        }
                    }

                    // TextField za unos novog taga
                    TextField("Add tag", text: $newTag, axis: .vertical)
                        
                        .frame(minHeight: 80)
                        .padding(.horizontal, 8)
                }
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
            
            // Dugme za dodavanje taga
            Button(action: {
                addTag()
            }) {
                Text("Add Tag")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    // Funkcija za dodavanje taga
    private func addTag() {
        if !newTag.isEmpty && !tags.contains(newTag) {
            tags.append(newTag)
            newTag = ""
        }
    }

    // Funkcija za uklanjanje taga
    private func removeTag(_ tag: String) {
        tags.removeAll { $0 == tag }
    }
}

#Preview {
    InputSearch()
}
