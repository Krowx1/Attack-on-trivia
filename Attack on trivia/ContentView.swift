//
//  ContentView.swift
//  Attack on trivia
//
//  Created by Krow on 12/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var question = 0
    @State private var answer = 0
    @State private var score = 0
    
    @State private var correctAnswer = 0
    @State private var number = Int.random(in:0..<15)
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingScore = false
    @State private var count = 0
    
    @State private var restartGame = false
    
    let aotQuestions = [
        [
            "question": "Who placed first in ODM Gear training?",
            "answers" : [
                "Jean Kirstein",
                "Annie Leonhart",
                "Mikasa Ackerman",
                "Eren Yeager"
            ]
        ],
        
        [
            "question": "Why couldn't Eren master the ODM Gear at first?",
            "answers" : [
                "He couldn't",
                "His gear was broken",
                "He was distracted",
                "He was nervous"
            ],
        ],
        [
            "question": "How many titan shifters are there?",
            "answers" : [
                "12",
                "Theres only abnormal and pure titans",
                "9",
                "13"
            ],
        ],
        [
            "question": "Which titan is Eren Yeagers titan?",
            "answers" : [
                "The cart titan",
                "The attack titan",
                "The beast titan",
                "The war hammer titan"
            ],
            
        ],
        [
            "question": "Who founded the Yeagerists?",
            "answers" : [
                "Bertolt Hoover",
                "Reiner Braun",
                "Floch Forester",
                "Eren Yeager"
            ],
            
        ],
        [
            "question": "What was Eren, Mikasa, and Armins hometown?",
            "answers" : [
                "The underground",
                "Shiganshina",
                "Trost",
                "Stohess"
            ],
        ],
        [
            "question": "Who were the walls named after?",
            "answers" : [
                "Founder Ymirs grandkids",
                "Founder Ymirs children",
                "Founder Ymirs parents",
                "No one, they just call the walls that."
            ],
        ],
        [
            "question": "Where was Levi Ackerman raised?",
            "answers" : [
                "The underground",
                "Shiganshina",
                "Stohess",
                "Trost"
            ],
        ],
        [
            "question": "Most titans cant regenerate right after an accident, but this titan can.",
            "answers" : [
                "The beast titan",
                "The cart titan",
                "The attack titan",
                "The war hammer"
            ],
        ],
        [
            "question": "How many years did the walls go without a titan attck?",
            "answers" : [
                "90",
                "150",
                "100",
                "A what?"
            ],
        ],
        [
            "question": "Why did Erwin ask Eren who he thinks the enemy is?",
            "answers" : [
                "He knows their enemies are more than just the titans.",
                "He was just wondering.",
                "He wanted to keep Eren on his feet.",
                "Erwin doesn't even know."
            ],
        ],
        [
            "question": "How many years do titan shifters live for?",
            "answers" : [
                "No limit",
                "90",
                "85",
                "13"
            ],
        ],
        [
            "question": "What year is Attack on Titan based in?",
            "answers" : [
                "1986",
                "WW2",
                "1269",
                "850"
            ],
        ],
        [
            "question": "Why can only the cart titan regenerate right after an accident?",
            "answers" : [
                "Shes just that cool",
                "Her titan is not for fighting"
            ],
        ]
    ]
    
    let  answers = [
        "Jean Kirstein",
        "His gear was broken",
        "9",
        "The attack titan",
        "Floch Forester",
        "Shiganshina",
        "Founder Ymirs children",
        "The underground",
        "the cart titan",
        "100",
        "He knows their enemies are more than just the titans.",
        "13",
        "850",
        "Her titan is not for fighting"
    ]
    
    @State private var questionIndex = 0
    
    @State private var message = "answers"
    
    @State private var ques = [
        [
            "question": "First Question",
            "answer": "First Answer"
        ],
        [
            "question": "Second Question",
            "answer": "Second Answer"
        ],
        [
            "question": "Third Question",
            "answer": "Third Answer"
        ],
        [
            "question": "Fourth Question",
            "answer": "Fourth Answer"
        ],
        [
            "question": "Fifth Question",
            "answer": "Fifth Answer"
        ],
        [
            "question": "Sixth Question",
            "answer": "Sixth Answer"
        ],
        [
            "question": "Seventh Question",
            "answer": "Seventh Answer"
        ],
        [
            "question": "Eigth Question",
            "answer": "Eigth Answer"
        ],
        [
            "question": "Ninth Question",
            "answer": "Ninth Answer"
        ],
        [
            "question": "Tenth Question",
            "answer": "Tenth Answer"
        ],
        [
            "question": "Eleventh Question",
            "answer": "Eleventh Answer"
        ],
        [
            "question": "Twelveth Question",
            "answer": "Twelveth Answer"
        ],
        [
            "question": "Thirteenth Question",
            "answer": "Thirteenth Answer"
        ]
    ]
    
    
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.red, .green], startPoint:.top, endPoint:.bottom)
                .ignoresSafeArea()
            
            
            VStack {
                
                Text("Attack on Trivia")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
            }
            VStack{
            
                Button {
                    checkAnswer(ans: 0)
                } label: {
                    Text("answer 1")
                }
                
                Button {
                    checkAnswer(ans: 1)
                } label: {
                    Text("Answer 2")
                }
                
                Button {
                    checkAnswer(ans: 2)
                } label: {
                    Text("Answer 3")
                }
                
                Button {
                    checkAnswer(ans: 3)
                } label: {
                    Text("Answer 4")
                }
                
                
                Button {
                    nextQuestion()
                } label: {
                    Text("Next Question")
                }
            }
        }
    }
        func nextQuestion() {
           if (questionIndex < aotQuestions.count - 1){
                questionIndex += 1
                message = aotQuestions[questionIndex]["question"]! as! String
            } else {
                message = "Game Over!"
            }
        }
            //func checkAnswer(ans: Int){
             //   var answerChoices: [String] = aotQuestions[questionIndex]["answers"]! as! [String]
                
    
    func checkAnswer(){
        if answer == correctAnswer {
            score += 1
            alertTitle = "Awesome!"
            alertMessage = "That's right!"
    
        } else {
            alertTitle = "Uh Oh!"
            alertMessage = "Close, but the correct answer is \(correctAnswer)!"
        }
        showingScore = true
        count += 1
    }
    func askQuestion(){
        correctAnswer = 0
        answer = 0
        if count < question {
            number = Int.random(in: 0..<15)
        }
        else {
            restartGame = true
        }
        
    }
    
    func restart() {
        score = 0
        count = 0
        answer = 0
        correctAnswer = 0
        askQuestion()
    }
            
        
    
}
    
    #Preview {
        ContentView()
    }

