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

// Extension with methods we use for setting the data to actual `UITableViewCell`s.
// MARK: - Methods for setting CoreMotion data
extension MotionInfoViewController {

    /// Sets rotation rate data values to a specified `DataTableSection`.
    /// - Parameters:
    ///   - rotationRate: A `CMRotationRate` holding the values to set.
    ///   - section: Section these values need to be applied to.
    func report(rotationRate: CMRotationRate?, inSection section: DataTableSection) {
        let units = "rad/s"
        
        display(value: rotationRate?.x, forRow: .axisX, inSection: section, units: units, maxValue: 10)
        display(value: rotationRate?.y, forRow: .axisY, inSection: section, units: units, maxValue: 10)
        display(value: rotationRate?.z, forRow: .axisZ, inSection: section, units: units, maxValue: 10)
    }

    /// Sets acceleration data values to a specified `DataTableSection`.
    /// - Parameters:
    ///   - acceleration: A `CMAcceleration` holding the values to set.
    ///   - section: Section these values need to be applied to.
    func report(acceleration: CMAcceleration?, inSection section: DataTableSection) {
        let units = "G"
        
        display(value: acceleration?.x, forRow: .axisX, inSection: section, units: units, maxValue: 3)
        display(value: acceleration?.y, forRow: .axisY, inSection: section, units: units, maxValue: 3)
        display(value: acceleration?.z, forRow: .axisZ, inSection: section, units: units, maxValue: 3)
    }

    /// Sets magnetic field data values to a specified `DataTableSection`.
    /// - Parameters:
    ///   - magneticField: A `CMMagneticField` holding the values to set.
    ///   - section: Section these values need to be applied to.
    func report(magneticField: CMMagneticField?, inSection section: DataTableSection) {
        let units = "μT"
        
        display(value: magneticField?.x, forRow: .axisX, inSection: section, units: units)
        display(value: magneticField?.y, forRow: .axisY, inSection: section, units: units)
        display(value: magneticField?.z, forRow: .axisZ, inSection: section, units: units)
    }

    /// Sets the value to a specific section and cell in the `UITableView`.
    /// - Parameters:
    ///   - value: Value to be set. If no value is provided (e.g. we use `nil`), we set `?`.
    ///   - row: A `DataTableRow` to set the value to.
    ///   - section: A `DataTableSection` of the cell.
    ///   - units: String containing units of the value.
    ///   - minValue: Minimum value, used for highlighting value changes with color. Default is 0.
    ///   - maxValue: Maximum value, used for highlighting value changes with color. Default it 0.
    private func display(value: Double? = nil, forRow row: DataTableRow, inSection section: DataTableSection, units: String, minValue: Double = 0, maxValue: Double = 0) {
        guard let cell = tableView.cellForRow(at: IndexPath(row: row.rawValue, section: section.index)) else { return }

        let valueString = value != nil ? String(format: "%.2f", arguments: [value!]) : "?"
        
        cell.detailTextLabel?.text = "\(valueString) \(units)"
        cell.backgroundColor = maxValue > minValue ? row.color.withAlphaComponent(CGFloat(abs(value ?? 0)/(maxValue - minValue))) : UIColor.clear
    }
}

