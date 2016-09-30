//
//  MotionInfoEnums.swift
//  YBDeviceMotion
//
//  Created by Alex Staravoitau on 06/04/2016.
//  Copyright © 2016 Old Yellow Bricks. All rights reserved.
//

import UIKit

/**
 Device sensors available on an iOS device.
 
 - `gyro`:          Gyroscope.
 - `accelerometer`: Accelerometer.
 - `magnetormeter`: Magnetormeter.
 - `deviceMotion`:  A set of iOS SDK algorithms that work with raw sensors data.
 */
internal enum DeviceSensor {
    
    /// Gyroscope
    case gyro
    /// Accelerometer
    case accelerometer
    /// Magnetormeter
    case magnetometer
    /// A set of iOS SDK algorithms that work with raw sensors data
    case deviceMotion
    
    /// A description of the sensor as a `String`.
    internal var description: String {
        switch self {
        case .gyro:
            return "Gyroscope"
        case .accelerometer:
            return "Accelerometer"
        case .magnetometer:
            return "Magnetometer"
        case .deviceMotion:
            return "Device Motion Algorithm"
        }
    }
    
}

/**
 Sections of the `UITableView` we use to display sensors' data.
 
 - `rawGyroData`:                     Raw gyroscope data.
 - `rawAccelerometerData`:            Raw accelerometer data.
 - `rawMagnetometerData`:             Raw magnetometer data.
 - `rotationRate`:        Rotation rate as returned by the `DeviceMotion` algorithms.
 - `userAcceleration`:    User acceleration as returned by the `DeviceMotion` algorithms.
 - `gravity`:             Gravity value as returned by the `DeviceMotion` algorithms.
 */
internal enum DataTableSection {
    
    /// Raw gyroscope data.
    case rawGyroData
    /// Raw accelerometer data.
    case rawAccelerometerData
    /// Raw magnetometer data.
    case rawMagnetometerData
    /// Rotation rate as returned by the `DeviceMotion` algorithms.
    case rotationRate
    /// User acceleration as returned by the `DeviceMotion` algorithms.
    case userAcceleration
    /// Gravity value as returned by the `DeviceMotion` algorithms.
    case gravity
    
    /// An `Array` of all sections in the order specified in the storyboard.
    internal static let allSections = [userAcceleration, gravity, rotationRate, rawAccelerometerData, rawGyroData, rawMagnetometerData]
    
    /// `Int` index of the section in `UITableView`.
    internal var index: Int {
        return DataTableSection.allSections.index(of: self) ?? 0
    }
    
}

/**
 Rows we use for displaying data in `UITableView`.
 
 - `axisX`: `X` axis value index
 - `axisY`: `Y` axis value index
 - `axisZ`: `Z` axis value index
 */
internal enum DataTableRow: Int {
    
    case axisX = 0
    case axisY = 1
    case axisZ = 2
    
    /// We are going to assign a color for each axis to display values fluctiation visually.
    internal var color: UIColor {
        switch self {
        case .axisX:
            return UIColor.red
        case .axisY:
            return UIColor.green
        case .axisZ:
            return UIColor.blue
        }
    }

}



