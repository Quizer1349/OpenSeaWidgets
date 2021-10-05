//
//  CharacterViewModelTests.swift
//  OpenSeaWidgetsTests
//
//  Created by Oleksii Skliarenko on 05.07.2021.
//

import XCTest
@testable import OpenSeaWidgets

class CharacterViewModelTests: XCTestCase {
    
    func test_FormattedEpisodesGoodSequenceIds() {
        let episodeRanges = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let mockedChar = mockCharacterViewModelWithEpisodes(episodeRanges)
        
        XCTAssertEqual(mockedChar.formattedEpisodesList(), "1-10")
    }
    
    func test_FormattedEpisodesOrder() {
        let episodeRanges = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let mockedChar = mockCharacterViewModelWithEpisodes(episodeRanges.shuffled())
        
        XCTAssertEqual(mockedChar.formattedEpisodesList(), "1-10")
    }
    
    func test_FormattedEpisodesRaggySequenceIds() {
        let episodeRanges = [1, 2, 3, 5, 6, 7, 8, 9, 10, 45, 122]
        let mockedChar = mockCharacterViewModelWithEpisodes(episodeRanges)
        
        XCTAssertEqual(mockedChar.formattedEpisodesList(), "1-3, 5-10, 45, 122")
    }
    
    func test_FormattedEpisodesEmptySequenceIds() {
        let episodeRanges = [Int]()
        let mockedChar = mockCharacterViewModelWithEpisodes(episodeRanges)
        
        XCTAssertEqual(mockedChar.formattedEpisodesList(), "")
    }
    
    func test_FormattedEpisodesSingleSequenceIds() {
        let episodeRanges = [100]
        let mockedChar = mockCharacterViewModelWithEpisodes(episodeRanges)
        
        XCTAssertEqual(mockedChar.formattedEpisodesList(), "100")
    }
    
    func test_FormattedEpisodesPairSequenceIds() {
        let episodeRanges = [100, 101, 104, 105, 110]
        let mockedChar = mockCharacterViewModelWithEpisodes(episodeRanges)
        
        XCTAssertEqual(mockedChar.formattedEpisodesList(), "100, 101, 104, 105, 110")
    }
    
    private func mockCharacterViewModelWithEpisodes(_ episodes: [Int]) -> CharacterViewModel {
        let episodeURLs = episodes.map({ "https://rickandmortyapi.com/api/episode/\($0)" })
        let mockLoc = Location(name: "", url: "")
        let mockChar = Character(id: 1,
                                 name: "",
                                 status: .unknown,
                                 species: "",
                                 type: "",
                                 gender: .unknown,
                                 origin: mockLoc,
                                 location: mockLoc,
                                 image: "",
                                 episode: episodeURLs,
                                 url: "",
                                 created: "")
        return CharacterViewModel(character: mockChar)
    }

}
