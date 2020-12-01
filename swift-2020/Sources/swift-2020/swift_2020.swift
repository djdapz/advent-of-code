struct swift_2020 {
    var text = "Hello, World!"
    var inputs = Inputs()
    
    
    func run(){
        let day1 = Day1(expenses: inputs.day1)
        print(day1.problem1())
        print(day1.problem2())
    }
}
