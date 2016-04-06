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
 
 - `Gyro`:          Gyroscope.
 - `Accelerometer`: Accelerometer.
 - `Magnetormeter`: Magnetormeter.
 - `DeviceMotion`:  A set of iOS SDK algorithms that work with raw sensors data.
 */
internal enum DeviceSensor {
    
    /// Gyroscope
    case Gyro
    /// Accelerometer
    case Accelerometer
    /// Magnetormeter
    case Magnetometer
    /// A set of iOS SDK algorithms that work with raw sensors data
    case DeviceMotion
    
    /// A description of the sensor as a `String`.
    internal var description: String {
        switch self {
        case Gyro:
            return "Gyroscope"
        case Accelerometer:
            return "Accelerometer"
        case Magnetometer:
            return "Magnetometer"
        case DeviceMotion:
            return "Device Motion Algorithm"
        }
    }
    
}

/**
 Sections of the `UITableView` we use to display sensors' data.
 
 - `RawGyroData`:                     Raw gyroscope data.
 - `RawAccelerometerData`:            Raw accelerometer data.
 - `RawMagnetometerData`:             Raw magnetometer data.
 - `DeviceMotionRotationRate`:        Rotation rate as returned by the `DeviceMotion` algorithms.
 - `DeviceMotionUserAcceleration`:    User acceleration as returned by the `DeviceMotion` algorithms.
 - `DeviceMotionGravity`:             Gravity value as returned by the `DeviceMotion` algorithms.
 */
internal enum DataTableSection {
    
    /// Raw gyroscope data.
    case RawGyroData
    /// Raw accelerometer data.
    case RawAccelerometerData
    /// Raw magnetometer data.
    case RawMagnetometerData
    /// Rotation rate as returned by the `DeviceMotion` algorithms.
    case DeviceMotionRotationRate
    /// User acceleration as returned by the `DeviceMotion` algorithms.
    case DeviceMotionUserAcceleration
    /// Gravity value as returned by the `DeviceMotion` algorithms.
    case DeviceMotionGravity
    
    /// An `Array` of all sections in the order specified in the storyboard.
    internal static let allSections = [DeviceMotionUserAcceleration, DeviceMotionGravity, DeviceMotionRotationRate, RawAccelerometerData, RawGyroData, RawMagnetometerData]
    
    /// `Int` index of the section in `UITableView`.
    internal var index: Int {
        return DataTableSection.allSections.indexOf(self) ?? 0
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
            return .redColor()
        case .axisY:
            return .greenColor()
        case .axisZ:
            return .blueColor()
        }
    }

}



