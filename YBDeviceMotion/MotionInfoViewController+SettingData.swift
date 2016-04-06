//
//  MotionInfoViewController+SettingData.swift
//  YBDeviceMotion
//
//  Created by Alex Staravoitau on 06/04/2016.
//  Copyright © 2016 Old Yellow Bricks. All rights reserved.
//

import CoreGraphics
import CoreMotion
import UIKit

/**
 Extension with methods we use for setting the data to actual `UITableViewCell`s.
 */

// MARK: - Methods for setting CoreMotion data
extension MotionInfoViewController {
    
    /**
     Sets rotation rate data values to a specified `DataTableSection`.
     
     - parameter rotationRate: A `CMRotationRate` holding the values to set.
     - parameter section:      Section these values need to be applied to.
     */
    internal func setRotationRateData(rotationRate: CMRotationRate?, forSection section: DataTableSection) {
        let units = "rad/s"
        
        setValue(rotationRate?.x, forRow: .axisX, section: section, units: units, maxValue: 10)
        setValue(rotationRate?.y, forRow: .axisY, section: section, units: units, maxValue: 10)
        setValue(rotationRate?.z, forRow: .axisZ, section: section, units: units, maxValue: 10)
    }
    
    /**
     Sets acceleration data values to a specified `DataTableSection`.
     
     - parameter acceleration: A `CMAcceleration` holding the values to set.
     - parameter section:      Section these values need to be applied to.
     */
    internal func setAccelerationData(acceleration: CMAcceleration?, forSection section: DataTableSection) {
        let units = "G"
        
        setValue(acceleration?.x, forRow: .axisX, section: section, units: units, maxValue: 3)
        setValue(acceleration?.y, forRow: .axisY, section: section, units: units, maxValue: 3)
        setValue(acceleration?.z, forRow: .axisZ, section: section, units: units, maxValue: 3)
    }
    
    /**
     Sets magnetic field data values to a specified `DataTableSection`.
     
     - parameter magnitude:     A `CMMagneticField` holding the values to set.
     - parameter section:      Section these values need to be applied to.
     */
    internal func setMagneticFieldData(magnitude: CMMagneticField?, forSection section: DataTableSection) {
        let units = "mT"
        
        setValue(magnitude?.x, forRow: .axisX, section: section, units: units)
        setValue(magnitude?.y, forRow: .axisY, section: section, units: units)
        setValue(magnitude?.z, forRow: .axisZ, section: section, units: units)
    }
    
    /**
     Sets the value to a specific section and cell in the `UITableView`.
     
     - parameter value:     Value to be set. If no value is provided (e.g. we use `nil`), we set `?`.
     - parameter row:       A `DataTableRow` to set the value to.
     - parameter section:   A `DataTableSection` of the cell.
     - parameter units:     String containing units of the value.
     - parameter minValue:  Minimum value, used for highlighting value changes with color. Default is 0.
     - parameter minValue:  Maximum value, used for highlighting value changes with color. Default it 0.
     */
    private func setValue(value: Double? = nil, forRow row: DataTableRow, section: DataTableSection, units: String, minValue: Double = 0, maxValue: Double = 0) {
        guard let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row.rawValue, inSection: section.index)) else { return }

        let valueString = value != nil ? String(format: "%.2f", arguments: [value!]) : "?"
        
        cell.detailTextLabel?.text = "\(valueString) \(units)"
        cell.backgroundColor = maxValue > minValue ? row.color.colorWithAlphaComponent(CGFloat(abs(value ?? 0)/(maxValue - minValue))) : UIColor.clearColor()
    }
}

