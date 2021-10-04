//
//  CharacterTableCell.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import UIKit

class CharacterTableCell: UITableViewCell {
    // MARK: UI props
    private(set) lazy var cardView: CardView = {
        let card = CardView(frame: .zero)
        return card
    }()

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private(set) lazy var typeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private(set) lazy var detailsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private(set) lazy var originLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private(set) lazy var episodesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private(set) lazy var characterImage: AvatarView = {
        let image = AvatarView(frame: .zero)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private(set) lazy var deadStatusImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: props
    private var imageLoadTask: Cancellable?
    private let padding = Configs.Layouts.charsListCellPadding

    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupUI()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImage.image = nil
        deadStatusImage.image = nil
//        imageLoadTask?.cancel()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupCardView()
        setupImageView()
        setupDeadStatusImageView()
        setupTitleLabel()
        setupTypeLabel()
        setupDetailsLabel()
        setupOriginLabel()
        setupEpisodesLabel()
    }
    
    
    private func setupCardView() {
        contentView.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding / 2),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding / 2),
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .darkText
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.7
        cardView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: padding),
            titleLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -padding / 4),
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding / 2),
        ])
    }
    
    private func setupTypeLabel() {
        typeLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        typeLabel.textColor = .darkText
        typeLabel.numberOfLines = 1
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.minimumScaleFactor = 0.7
        cardView.addSubview(typeLabel)
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: padding),
            typeLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -padding / 4),
            typeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        ])
    }
    
    private func setupDetailsLabel() {
        detailsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        detailsLabel.textColor = .darkGray
        detailsLabel.numberOfLines = 2
        cardView.addSubview(detailsLabel)
        
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: padding),
            detailsLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -padding / 4),
            detailsLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: padding / 3),
        ])
    }
    
    private func setupOriginLabel() {
        originLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        originLabel.textColor = .darkGray
        originLabel.numberOfLines = 2
        cardView.addSubview(originLabel)
        
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            originLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: padding),
            originLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -padding / 4),
            originLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: padding / 4),
        ])
    }
    
    private func setupEpisodesLabel() {
        episodesLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        episodesLabel.textColor = .darkGray
        episodesLabel.numberOfLines = 3
        cardView.addSubview(episodesLabel)
        
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodesLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: padding),
            episodesLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -padding / 4),
            episodesLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: padding / 4),
        ])
    }
    
    private func setupImageView() {
        cardView.addSubview(characterImage)
        
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: padding / 4),
            characterImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding / 4),
            characterImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -padding / 4),
            characterImage.widthAnchor.constraint(equalTo: cardView.heightAnchor, constant: -padding / 4)
        ])
    }
    
    private func setupDeadStatusImageView() {
        deadStatusImage.alpha = 0.2
        deadStatusImage.layer.masksToBounds = true
        cardView.addSubview(deadStatusImage)
        
        deadStatusImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deadStatusImage.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: -padding * 2),
            deadStatusImage.topAnchor.constraint(equalTo: cardView.topAnchor),
            deadStatusImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            deadStatusImage.rightAnchor.constraint(equalTo: cardView.rightAnchor)
        ])
    }
    
    // MARK: Helpers
    private func updateImageViewWithURL(_ url: URL?) {
        guard let imageURL = url as NSURL? else { return }
        imageLoadTask = ImageLoader.shared.load(url: imageURL) { [weak self] image in
            DispatchQueue.main.async {
                self?.characterImage.image = image
                self?.layoutIfNeeded()
            }
         }
    }
}

//MARK: - CellConfigurable
extension CharacterTableCell: CellConfigurable {
    typealias DataType = AssetViewModel
    
    func configure(data: AssetViewModel) {
        titleLabel.text = data.name
        updateImageViewWithURL(data.imageURL)
    }
}

