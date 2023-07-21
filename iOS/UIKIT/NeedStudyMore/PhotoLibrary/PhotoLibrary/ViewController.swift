//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by 방유빈 on 2023/04/04.
//

import UIKit
enum CameraError : Error{
    case notAvailable
}

class ViewController: UIViewController {
    @IBOutlet var imgView:UIImageView!
    
    let imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func addBtnClick(_ sender:UIButton){
        let alert =  UIAlertController(title: "Title", message: "message", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "앨범에서 가져오기", style: .default) { (action) in self.openLibrary() }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            guard (try? self.openCamera()) != nil else{
                let alert = UIAlertController(title: "카메라 접근 실패", message: "카메라를 이용할 수 없습니다.", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: false, completion: nil)
                print("Camera Not Available")
                return
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    func openLibrary(){
        imgPicker.sourceType = .photoLibrary
        present(imgPicker, animated: false, completion: nil)
    }
    func openCamera() throws{
        guard UIImagePickerController .isSourceTypeAvailable(.camera) else {
            throw CameraError.notAvailable
        }
        imgPicker.sourceType = .camera
        present(imgPicker, animated: false, completion: nil)
    }
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
            print(info)
            
        }
        dismiss(animated: true, completion: nil)
    }
}

