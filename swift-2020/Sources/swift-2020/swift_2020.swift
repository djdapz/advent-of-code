struct swift_2020 {
    var text = "Hello, World!"
    var inputs = Inputs()
    
    
    func run(){
        let day1 = Day1(expenses: inputs.day1)
        let day2 = Day2(strings: inputs.day2)
        print(day1.problem1())
        print(day1.problem2())
        print(day2.problem1())
        print(day2.problem2())
    }
}
