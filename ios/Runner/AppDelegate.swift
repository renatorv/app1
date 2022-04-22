import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let deviceChannel = FlutterMethodChannel(name: "flutter.methodchannel/iOS/recupera.cpf",
                                                 binaryMessenger: controller.binaryMessenger)
        
        prepareMethodHandler(deviceChannel: deviceChannel)
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
        
        deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            if call.method == "getDeviceModel" {
                let _cpfController = call.arguments as! String
                print("cpfController....")
                print(_cpfController)
                
                let application = UIApplication.shared
                let secondPath = "second://\(_cpfController)"
                
                let appUrl = URL(string: secondPath)!
                
                let websiteUrl = URL(string: "https://kiloloco.com")!
                
                if application.canOpenURL(appUrl){
                    
                    application.openURL(appUrl)
                }else{
                    application.openURL(websiteUrl)
                }
                
                result("OK")
            }
            else {
                result(FlutterMethodNotImplemented)
                return
            }
            
        })
    }
}
