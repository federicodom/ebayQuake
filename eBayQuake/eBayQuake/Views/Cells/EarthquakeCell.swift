//
//  EarthquakeCell.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import UIKit

class EarthquakeCell: UITableViewCell {

    private lazy var iconImageView = UIImageView()
    private lazy var sourceLabel = UILabel()
    private lazy var magnitudeLabel = UILabel()
    private lazy var depthLabel = UILabel()
    private lazy var dateTimeLabel = UILabel()
    private lazy var locationImageView = UIImageView()
    
    private let padding: CGFloat = 20
    
    private var viewModel: EarthquakeCellViewModel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureIconImageView()
        configureMagnitudeLabel()
        configureDateTimeLabel()
        configureSourceLabel()
        configureDepthLabel()
        configureLocationImageView()
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateCell(with viewModel: EarthquakeCellViewModel) {
        self.viewModel = viewModel
        
        magnitudeLabel.text = viewModel.magnitude
        magnitudeLabel.textColor = viewModel.isBigMagnitudeEarthquake() ? Colors.earthquakeRed : Colors.earthquakeGreen
        dateTimeLabel.text = " :calendar: \(viewModel.date)"
        sourceLabel.text = "Source: \(viewModel.source)"
        depthLabel.text = "Depth: \(viewModel.depth)"
        
        iconImageView.image = viewModel.isBigMagnitudeEarthquake() ? Images.icEarthquakeWarning : Images.icEarthquake
    }
    
}

// MARK: - Configure UI
private extension EarthquakeCell {
    
    func configureIconImageView() {
        iconImageView.contentMode = .scaleAspectFill
        contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding ),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureMagnitudeLabel() {
        magnitudeLabel.textAlignment = .left
        magnitudeLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        magnitudeLabel.numberOfLines = 1
       
        contentView.addSubview(magnitudeLabel)
        magnitudeLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            magnitudeLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
            magnitudeLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            magnitudeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureDateTimeLabel() {
        dateTimeLabel.textAlignment = .left
        dateTimeLabel.textColor = Colors.datetimeLabel
        dateTimeLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        dateTimeLabel.numberOfLines = 1
       
        contentView.addSubview(dateTimeLabel)
        dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            dateTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            dateTimeLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            dateTimeLabel.heightAnchor.constraint(equalToConstant: 10)

        ])
    }
    
    func configureSourceLabel() {
        sourceLabel.textAlignment = .left
        sourceLabel.textColor = Colors.tittle
        sourceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        sourceLabel.numberOfLines = 1
       
        contentView.addSubview(sourceLabel)
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            sourceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
            sourceLabel.topAnchor.constraint(equalTo: magnitudeLabel.bottomAnchor, constant: 0),
            sourceLabel.heightAnchor.constraint(equalToConstant: 15)

        ])
    }
    
    func configureDepthLabel() {
        depthLabel.textAlignment = .left
        depthLabel.textColor = Colors.subtitle
        depthLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        depthLabel.numberOfLines = 1
       
        contentView.addSubview(depthLabel)
        depthLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            depthLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
            depthLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 2),
            depthLabel.heightAnchor.constraint(equalToConstant: 10)

        ])
    }
    
    func configureLocationImageView() {
      
        locationImageView.image =  Images.icEarthquakeLocation
        contentView.addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            locationImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            locationImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20)

        ])
    }
    
}
