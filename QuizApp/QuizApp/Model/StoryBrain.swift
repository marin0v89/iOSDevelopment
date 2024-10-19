//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    var storyIndex = 0
    
    func getStoryTitle() -> String {
        return stories[storyIndex].title
    }
    
    func getStoryChoice1() -> String {
        return stories[storyIndex].choice1
    }
    
    func getStoryChoice2() -> String {
        return stories[storyIndex].choice2
    }
    
    mutating func nextStory(userChoice: String) {
      let currentStory = stories[storyIndex]
        
        if userChoice == currentStory.choice1 {
            storyIndex = currentStory.choice1Destination
        } else if userChoice == currentStory.choice2 {
            storyIndex = currentStory.choice2Destination
        }
    }
}
