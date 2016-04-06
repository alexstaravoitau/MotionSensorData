//
//  ViewController.swift
//  YBDeviceMotion
//
//  Created by Alex Staravoitau on 06/04/2016.
//  Copyright © 2016 Old Yellow Bricks. All rights reserved.
//

import UIKit
import CoreMotion

/// A `UIViewController` class that displays data from the motion sensors available on the device.
final class MotionInfoViewController: UITableViewController {
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        // Initiate the `CoreMotion` updates to our callbacks.
        startAccelerometerUpdates()
        startGyroUpdates()
        startMagnetometerUpdates()
        startDeviceMotionUpdates()
    }
    
    /// CoreMotion manager instance we receive updates from.
    private let motionManager = CMMotionManager()
    
    // MARK: - Configuring CoreMotion callbacks triggered for each sensor
    
    /**
     *  Configure the raw accelerometer data callback.
     */
    private func startAccelerometerUpdates() {
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (accelerometerData, error) in
                self.setAccelerationData(accelerometerData?.acceleration, forSection: .RawAccelerometerData)
                self.logError(error, forSensor: .Accelerometer)
            })
        }
    }
    
    /**
     *  Configure the raw gyroscope data callback.
     */
    private func startGyroUpdates() {
        if motionManager.gyroAvailable {
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (gyroData, error) in
                self.setRotationRateData(gyroData?.rotationRate, forSection: .RawGyroData)
                self.logError(error, forSensor: .Gyro)
            })
        }
    }
    
    /**
     *  Configure the raw magnetometer data callback.
     */
    private func startMagnetometerUpdates() {
        if motionManager.magnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            motionManager.startMagnetometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (magnetometerData, error) in
                self.setMagneticFieldData(magnetometerData?.magneticField, forSection: .RawMagnetometerData)
                self.logError(error, forSensor: .Magnetometer)
            })
        }
    }
    
    /**
     *  Configure the Device Motion algorithm data callback.
     */
    private func startDeviceMotionUpdates() {
        if motionManager.deviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (deviceMotion, error) in
                self.setAccelerationData(deviceMotion?.gravity, forSection: .DeviceMotionGravity)
                self.setAccelerationData(deviceMotion?.userAcceleration, forSection: .DeviceMotionUserAcceleration)
                self.setRotationRateData(deviceMotion?.rotationRate, forSection: .DeviceMotionRotationRate)
                self.logError(error, forSensor: .DeviceMotion)
            })
        }
    }

    /**
     Logs an error in a consistent format.
     
     - parameter error:  Error value.
     - parameter sensor: `DeviceSensor` that triggered the error.
     */
    private func logError(error:NSError?, forSensor sensor:DeviceSensor) {
        guard let error = error else { return }
        
        NSLog("Error reading data from \(sensor.description): \n \(error) \n")
    }

}

