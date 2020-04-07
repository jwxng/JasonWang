struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        let lowercaseQuestion = question.lowercased()
        if lowercaseQuestion.hasPrefix("hello") {
            return "Why, hello there!"
        } else if lowercaseQuestion == "where are the cookies?" {
            return "In the cookie jar!"
        } else if lowercaseQuestion.hasPrefix("where") {
            return "To the North!"
        } else if lowercaseQuestion.hasPrefix("can i have a cookie") {
            return "NO!"
        } else if lowercaseQuestion == "should i go?" {
            return "You can stay for as long as you like."
        } else {
            let defaultAnswer = lowercaseQuestion.count % 2
            if defaultAnswer == 0 {
                return "I'm sorry, I don't understand the question."
            } else {
                return "Ask me another time."
            }
        }
    }
}
