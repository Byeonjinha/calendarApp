//
//  Home2.swift
//  badgerHouse (iOS)
//
//  Created by Byeon jinha on 2022/05/04.
//

import SwiftUI
import PhotosUI

struct Home2: View {
    @State var images : [UIImage] = []
    @State var picker = false
    var body: some View {
        VStack{
            if !images.isEmpty{
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing:15){
                        ForEach(images, id: \.self){img in Image(uiImage: img)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                                .cornerRadius(20)
                        }
                    }
                })
            }
            else{
                
                Button(action: {
                    picker.toggle()
                } , label: {
                    Text("Pick Images")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(.blue)
                        .clipShape(Capsule())
                })
            }
              
                }
        .sheet(isPresented : $picker){
            ImagePicker(images: $images, picker: $picker)
        }
    }
}

// New Image Picker API...

struct ImagePicker : UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent1: self)
    }
    
    @Binding var images : [UIImage]
    @Binding var picker : Bool
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        // you van also select videos using this picker.....
        
        config.filter = .images
        // 0 is used for multiple selection...
        config.selectionLimit = 0
        let picker = PHPickerViewController(configuration: config)
        // addinging delegate...
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator : NSObject, PHPickerViewControllerDelegate{
        var parent : ImagePicker
        
        init(parent1: ImagePicker) {
            parent = parent1
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results : [PHPickerResult]) {
            
            //closing picker...
            parent.picker.toggle()
            
            for img in results{
                //checking whether the image can be loaded...
                if img.itemProvider.canLoadObject(ofClass: UIImage.self){
                // retreving the
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (image, err) in
                        guard let image1 = image else{
                            return
                        }
                        
                        self.parent.images.append(image as! UIImage)
                    }
                }
                else{
                    //cannot be loaded
                    print("cannot be loaded")
                }
            }
        }
    }
}


struct Home2_Previews: PreviewProvider {
    static var previews: some View {
        Home2()
    }
}
