//
//  ViewController.swift
//  SensorMotion
//
//  Created by HuanGong on 16/5/23.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import CoreMotion
import CoreLocation
import UIKit

// CLLocationManagerDelegate is a protocol

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var acceleration: UIButton!
    var acc_started: Bool = false;
    
    @IBOutlet weak var gyroscope: UIButton!
    var gyr_started: Bool = false;
    
    @IBOutlet weak var PowerSensor: UIButton!
    var power_watching: Bool = false;
    
    @IBOutlet weak var magnetic: UIButton!
    var magnetic_started: Bool = false;
    
    @IBOutlet weak var distance: UIButton!
    var distance_started: Bool = false;
    
    var lm: CLLocationManager!
    var queue: NSOperationQueue!
    var motionManager: CMMotionManager!
    
    override func viewWillAppear(animated: Bool) {
        lm.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        queue = NSOperationQueue()
        lm = CLLocationManager()
        motionManager = CMMotionManager()
    }
    
    @IBAction func TestAcceleration() -> Void {
        
        if (false == acc_started) {
            //motionManager.accelerometerActive
            acceleration.setTitle("停止", forState: UIControlState.Normal)
            motionManager.accelerometerUpdateInterval = 1/2
            motionManager.startAccelerometerUpdatesToQueue(queue, withHandler: {
                //(accelerometerData : CMAccelerometerData!, error : NSError!) in
                (accelerometerData: CMAccelerometerData?, error: NSError?) in
                print("x:",accelerometerData?.acceleration.x)
                print("y:",accelerometerData?.acceleration.y)
                print("z:",accelerometerData?.acceleration.z)
            })
        } else {
            motionManager.stopAccelerometerUpdates()
            acceleration.setTitle("开始", forState: UIControlState.Normal)
        }
        acc_started = !acc_started
    }

    
    @IBAction func TestGyrscope() -> Void {
        
        if (false == gyr_started) {
            //motionManager.gyroActive
            gyroscope.setTitle("停止", forState: UIControlState.Normal)
            motionManager.gyroUpdateInterval = 1/2
            motionManager.startGyroUpdatesToQueue(queue, withHandler: {
                (gyroData:CMGyroData?, error: NSError?) in
                // CMGYroData 类中仅仅有一个变量 rotationRate, 保存着 各个方向的角速度: X-axis rotation rate in radians/second
                print("x轴的角速度:",gyroData?.rotationRate.x)
                print("y轴的角速度:",gyroData?.rotationRate.y)
                print("z轴的角速度:",gyroData?.rotationRate.z)
            })
        } else {
            motionManager.stopGyroUpdates()
            gyroscope.setTitle("开始", forState: UIControlState.Normal)
        }
        gyr_started = !gyr_started
    }
    
    func powerStatusNofity() -> Void {
        print("<<<<<<<< power changed")
        print(UIDevice.currentDevice().batteryLevel) // 0.0 ~ 1.0
        UIDevice.currentDevice().batteryState // enum
        /*
         case Unknown
         case Unplugged
         case Charging
         case Full
        */
    }
    
    @IBAction func TestPowerMonitor() -> Void {
        if (false == power_watching) {
            PowerSensor.setTitle("停止", forState: UIControlState.Normal)
            UIDevice.currentDevice().batteryMonitoringEnabled = true
            let action = #selector(powerStatusNofity)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: action, name: UIDeviceBatteryLevelDidChangeNotification, object: nil)
        } else {
            PowerSensor.setTitle("开始", forState: UIControlState.Normal)
            UIDevice.currentDevice().batteryMonitoringEnabled = false
            NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceBatteryLevelDidChangeNotification, object: nil)
        }
        power_watching = !power_watching
    }
    
    // 磁场传感器
    @IBAction func TestMagnetic() -> Void {
        if (magnetic_started == false) {
            magnetic.setTitle("停止", forState: UIControlState.Normal)
            lm.startUpdatingHeading()
            //lm.startUpdatingLocation() gps
        } else {
            lm.stopUpdatingHeading() // 这里heading 代表方向的意思
        }
        magnetic_started = !magnetic_started
    }
    // override CLLocationManagerDelegate function didUpdateHeading
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading)
    }
    
    //func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
    //    print("location changed")
    //}
    
    
    func proximityChanged() -> Void {
        print("<<<<<<<<proximity changed")
        print(UIDevice.currentDevice().proximityState) // true or false
    }
    
    @IBAction func TestDistance() -> Void {
        print("start test Proximity sensor")
        if (self.distance_started == false) {
            distance.setTitle("停止", forState: UIControlState.Normal)
            UIDevice.currentDevice().proximityMonitoringEnabled = true
            let action = #selector(proximityChanged)
            NSNotificationCenter.defaultCenter().addObserver(self, selector:action, name: UIDeviceProximityStateDidChangeNotification, object: nil)
        } else {
            distance.setTitle("开始", forState: UIControlState.Normal)
            UIDevice.currentDevice().proximityMonitoringEnabled = false
            NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceProximityStateDidChangeNotification, object: nil)

        }
        self.distance_started = !self.distance_started
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

